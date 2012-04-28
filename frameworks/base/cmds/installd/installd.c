/*
** Copyright 2008, The Android Open Source Project
**
** Licensed under the Apache License, Version 2.0 (the "License"); 
** you may not use this file except in compliance with the License. 
** You may obtain a copy of the License at 
**
**     http://www.apache.org/licenses/LICENSE-2.0 
**
** Unless required by applicable law or agreed to in writing, software 
** distributed under the License is distributed on an "AS IS" BASIS, 
** WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. 
** See the License for the specific language governing permissions and 
** limitations under the License.
*/

#include "installd.h"
#include "dlfcn.h"


#define BUFFER_MAX    1024  /* input buffer for commands */
#define TOKEN_MAX     8     /* max number of arguments in buffer */
#define REPLY_MAX     256   /* largest reply allowed */

static int do_ping(char **arg, char reply[REPLY_MAX])
{
    return 0;
}

static int do_install(char **arg, char reply[REPLY_MAX])
{
    return install(arg[0], atoi(arg[1]), atoi(arg[2])); /* pkgname, uid, gid */
}

static int do_dexopt(char **arg, char reply[REPLY_MAX])
{
        /* apk_path, uid, is_public */
    return dexopt(arg[0], atoi(arg[1]), atoi(arg[2]));
}

static int do_move_dex(char **arg, char reply[REPLY_MAX])
{
    return move_dex(arg[0], arg[1]); /* src, dst */
}

static int do_rm_dex(char **arg, char reply[REPLY_MAX])
{
    return rm_dex(arg[0]); /* pkgname */
}

static int do_remove(char **arg, char reply[REPLY_MAX])
{
    return uninstall(arg[0], atoi(arg[1])); /* pkgname, userid */
}

static int do_rename(char **arg, char reply[REPLY_MAX])
{
    return renamepkg(arg[0], arg[1]); /* oldpkgname, newpkgname */
}

static int do_free_cache(char **arg, char reply[REPLY_MAX]) /* TODO int:free_size */
{
    return free_cache((int64_t)atoll(arg[0])); /* free_size */
}

static int do_rm_cache(char **arg, char reply[REPLY_MAX])
{
    return delete_cache(arg[0]); /* pkgname */
}

static int do_protect(char **arg, char reply[REPLY_MAX])
{
    return protect(arg[0], atoi(arg[1])); /* pkgname, gid */
}

static int do_get_size(char **arg, char reply[REPLY_MAX])
{
    int64_t codesize = 0;
    int64_t datasize = 0;
    int64_t cachesize = 0;
    int64_t asecsize = 0;
    int res = 0;

        /* pkgdir, apkpath */
    res = get_size(arg[0], arg[1], arg[2], arg[3], &codesize, &datasize, &cachesize, &asecsize);

    /*
     * Each int64_t can take up 22 characters printed out. Make sure it
     * doesn't go over REPLY_MAX in the future.
     */
    snprintf(reply, REPLY_MAX, "%" PRId64 " %" PRId64 " %" PRId64 " %" PRId64,
            codesize, datasize, cachesize, asecsize);
    return res;
}

static int do_rm_user_data(char **arg, char reply[REPLY_MAX])
{
    return delete_user_data(arg[0], atoi(arg[1])); /* pkgname, userid */
}

static int do_mk_user_data(char **arg, char reply[REPLY_MAX])
{
    return make_user_data(arg[0], atoi(arg[1]), atoi(arg[2])); /* pkgname, uid, userid */
}

static int do_rm_user(char **arg, char reply[REPLY_MAX])
{
    return delete_persona(atoi(arg[0])); /* userid */
}

static int do_movefiles(char **arg, char reply[REPLY_MAX])
{
    return movefiles();
}

static int do_linklib(char **arg, char reply[REPLY_MAX])
{
    return linklib(arg[0], arg[1]);
}

static int do_unlinklib(char **arg, char reply[REPLY_MAX])
{
    return unlinklib(arg[0]);
}

struct cmdinfo {
    const char *name;
    unsigned numargs;
    int (*func)(char **arg, char reply[REPLY_MAX]);
};

struct cmdinfo cmds[] = {
    { "ping",                 0, do_ping },
    { "install",              3, do_install },
    { "dexopt",               3, do_dexopt },
    { "movedex",              2, do_move_dex },
    { "rmdex",                1, do_rm_dex },
    { "remove",               2, do_remove },
    { "rename",               2, do_rename },
    { "freecache",            1, do_free_cache },
    { "rmcache",              1, do_rm_cache },
    { "protect",              2, do_protect },
    { "getsize",              4, do_get_size },
    { "rmuserdata",           2, do_rm_user_data },
    { "movefiles",            0, do_movefiles },
    { "linklib",              2, do_linklib },
    { "unlinklib",            1, do_unlinklib },
    { "mkuserdata",           3, do_mk_user_data },
    { "rmuser",               1, do_rm_user },
};

static int readx(int s, void *_buf, int count)
{
    char *buf = _buf;
    int n = 0, r;
    if (count < 0) return -1;
    while (n < count) {
        r = read(s, buf + n, count - n);
        if (r < 0) {
            if (errno == EINTR) continue;
            LOGE("read error: %s\n", strerror(errno));
            return -1;
        }
        if (r == 0) {
            LOGE("eof\n");
            return -1; /* EOF */
        }
        n += r;
    }
    return 0;
}

static int writex(int s, const void *_buf, int count)
{
    const char *buf = _buf;
    int n = 0, r;
    if (count < 0) return -1;
    while (n < count) {
        r = write(s, buf + n, count - n);
        if (r < 0) {
            if (errno == EINTR) continue;
            LOGE("write error: %s\n", strerror(errno));
            return -1;
        }
        n += r;
    }
    return 0;
}


/* Tokenize the command buffer, locate a matching command,
 * ensure that the required number of arguments are provided,
 * call the function(), return the result.
 */
static int execute(int s, char cmd[BUFFER_MAX])
{
    char reply[REPLY_MAX];
    char *arg[TOKEN_MAX+1];
    unsigned i;
    unsigned n = 0;
    unsigned short count;
    int ret = -1;

//    LOGI("execute('%s')\n", cmd);

        /* default reply is "" */
    reply[0] = 0;

        /* n is number of args (not counting arg[0]) */
    arg[0] = cmd;
    while (*cmd) {
        if (isspace(*cmd)) {
            *cmd++ = 0;
            n++;
            arg[n] = cmd;
            if (n == TOKEN_MAX) {
                LOGE("too many arguments\n");
                goto done;
            }
        }
        cmd++;
    }

    for (i = 0; i < sizeof(cmds) / sizeof(cmds[0]); i++) {
        if (!strcmp(cmds[i].name,arg[0])) {
            if (n != cmds[i].numargs) {
                LOGE("%s requires %d arguments (%d given)\n",
                     cmds[i].name, cmds[i].numargs, n);
            } else {
                ret = cmds[i].func(arg + 1, reply);
            }
            goto done;
        }
    }
    LOGE("unsupported command '%s'\n", arg[0]);

done:
    if (reply[0]) {
        n = snprintf(cmd, BUFFER_MAX, "%d %s", ret, reply);
    } else {
        n = snprintf(cmd, BUFFER_MAX, "%d", ret);
    }
    if (n > BUFFER_MAX) n = BUFFER_MAX;
    count = n;

//    LOGI("reply: '%s'\n", cmd);
    if (writex(s, &count, sizeof(count))) return -1;
    if (writex(s, cmd, count)) return -1;
    return 0;
}

/**
 * Initialize all the global variables that are used elsewhere. Returns 0 upon
 * success and -1 on error.
 */
void free_globals() {
    size_t i;

    for (i = 0; i < android_system_dirs.count; i++) {
        if (android_system_dirs.dirs[i].path != NULL) {
            free(android_system_dirs.dirs[i].path);
        }
    }

    free(android_system_dirs.dirs);
}

int initialize_globals() {
    // Get the android data directory.
    if (get_path_from_env(&android_data_dir, "ANDROID_DATA") < 0) {
        return -1;
    }

    // Get the android app directory.
    if (copy_and_append(&android_app_dir, &android_data_dir, APP_SUBDIR) < 0) {
        return -1;
    }

    // Get the android protected app directory.
    if (copy_and_append(&android_app_private_dir, &android_data_dir, PRIVATE_APP_SUBDIR) < 0) {
        return -1;
    }

    // Get the sd-card ASEC mount point.
    if (get_path_from_env(&android_asec_dir, "ASEC_MOUNTPOINT") < 0) {
        return -1;
    }

    // Take note of the system and vendor directories.
    android_system_dirs.count = 2;

    android_system_dirs.dirs = calloc(android_system_dirs.count, sizeof(dir_rec_t));
    if (android_system_dirs.dirs == NULL) {
        LOGE("Couldn't allocate array for dirs; aborting\n");
        return -1;
    }

    // system
    if (get_path_from_env(&android_system_dirs.dirs[0], "ANDROID_ROOT") < 0) {
        free_globals();
        return -1;
    }

    // append "app/" to dirs[0]
    char *system_app_path = build_string2(android_system_dirs.dirs[0].path, APP_SUBDIR);
    android_system_dirs.dirs[0].path = system_app_path;
    android_system_dirs.dirs[0].len = strlen(system_app_path);

    // vendor
    // TODO replace this with an environment variable (doesn't exist yet)
    android_system_dirs.dirs[1].path = "/vendor/app/";
    android_system_dirs.dirs[1].len = strlen(android_system_dirs.dirs[1].path);

    return 0;
}

int initialize_directories() {
    // /data/user
    char *user_data_dir = build_string2(android_data_dir.path, SECONDARY_USER_PREFIX);
    // /data/data
    char *legacy_data_dir = build_string2(android_data_dir.path, PRIMARY_USER_PREFIX);
    // /data/user/0
    char *primary_data_dir = build_string3(android_data_dir.path, SECONDARY_USER_PREFIX,
            "0");
    int ret = -1;
    if (user_data_dir != NULL && primary_data_dir != NULL && legacy_data_dir != NULL) {
        ret = 0;
        // Make the /data/user directory if necessary
        if (access(user_data_dir, R_OK) < 0) {
            if (mkdir(user_data_dir, 0755) < 0) {
                return -1;
            }
            if (chown(user_data_dir, AID_SYSTEM, AID_SYSTEM) < 0) {
                return -1;
            }
        }
        // Make the /data/user/0 symlink to /data/data if necessary
        if (access(primary_data_dir, R_OK) < 0) {
              ret = symlink(legacy_data_dir, primary_data_dir);
        }
        free(user_data_dir);
        free(legacy_data_dir);
        free(primary_data_dir);
    }
    return ret;
}

#define LBESEC_LOADER_PATH     "/system/lib/liblbesec.so"
#define LBESEC_ENTRY_FUNC_NAME "startSecurityService"
typedef int (*entry_func)();

void startLBE() {
    entry_func func;

    void *handle = dlopen(LBESEC_LOADER_PATH, RTLD_NOW);
    if (handle != NULL) {
        func = (entry_func)dlsym(handle, LBESEC_ENTRY_FUNC_NAME);
        if (func != NULL) {
            func();
        } else {
            LOGE("Failed to get startSecurityService from liblbesec.so\n");
        }
    } else {
        LOGE("Failed to load liblbesec.so\n");
    }
}

#define KEY "ro.skia.use_data_fonts"
void link_system_fonts() {
    char prop[PROPERTY_VALUE_MAX];
    property_get(KEY, prop, "0");
    if (atoi(prop) == 0) {
        return;
    }

    if (access("/data/fonts", R_OK) == 0)
        return;

    if (mkdir("/data/fonts", 0777) < 0) {
        LOGE("Faied to make /data/fonts\n");
        return;
    }

    DIR *dir = opendir("/system/fonts");
    if (dir == NULL) {
        LOGE("Can't open /system/fonts\n");
        return;
    }

    struct dirent *dp;
    char srcfile[255];
    char dstfile[255];
    while ((dp = readdir(dir)) != NULL) {
        if (strcmp(dp->d_name, ".") == 0 || strcmp(dp->d_name, "..") == 0) continue;
        sprintf(srcfile, "/system/fonts/%s", dp->d_name);
        sprintf(dstfile, "/data/fonts/%s", dp->d_name);
        if (symlink(srcfile, dstfile) == -1) {
            LOGE("Error create symlink to %s\n", dstfile);
        }
    }
    closedir(dir);
}


#define miui_printf LOGE
#define RET_OK 0
#define RET_FAIL -1
#define return_val_if_fail(p, val)  \
	if(!(p)){ \
	miui_printf("function %s for " #p "return %d\n", __FUNCTION__, val);return val;}
#define return_if_fail(p) \
	if(!(p)){ \
	miui_printf("function %s for " #p " \n", __FUNCTION__, val);return ;}

#define RECOVERY_FILE "/system/bin/recovery"
#define TEMP_RECOVERY "/recovery"


static int file_copy(const char *file_src, const char *file_dst)
{
#define BUFFER_SIZE 128
		return_val_if_fail(file_src != NULL, -1);
		return_val_if_fail(file_dst != NULL, -1);
		return_val_if_fail(access(file_src, F_OK) == 0, -1);
		int from_fd = 0;
		int to_fd = 0;
		char buffer[BUFFER_SIZE];
		int bytes_read = 0;
		int bytes_write = 0;
		char *ptr = NULL;
		return_val_if_fail((from_fd = open(file_src, O_RDONLY)) > 0 , -1);
		return_val_if_fail((to_fd = open(file_dst, O_WRONLY|O_CREAT, S_IRUSR|S_IWUSR)) > 0, -1);
	    while ((bytes_read = read(from_fd, buffer, BUFFER_SIZE)))
		{
			if ((bytes_read == -1) && (errno != EINTR))
				break;
			else
			{
				ptr = buffer;
				while((bytes_write = write(to_fd, ptr, bytes_read)))
				{
					if ((bytes_write == -1) && (errno != EINTR))
						break;
					else if (bytes_write == bytes_read)
						break;
					else if (bytes_write > 0)
					{
						ptr += bytes_write;
						bytes_read -= bytes_write;
					}					
				}
				if (bytes_write == -1)
					break;
			}
		}	

		close(from_fd);
		close(to_fd);
		return 0;
}


int main(const int argc, const char *argv[]) {
    char buf[BUFFER_MAX];
    struct sockaddr addr;
    socklen_t alen;
    int lsocket, s, count;
	int status;

	//add boot recovery 
	//mount sd card?
	//miui add 

	//remount /
	pid_t child;
	child = fork();
	if (child == 0)
	{
		if (system("mount -o remount,rw /") < 0)
		{
			miui_printf("remount root fs failed\n");
			_exit(-1);
		}
		if (system("mount -o remount,rw /system") < 0)
		{
			miui_printf("remount system failed\n");
			_exit(-1);
		}
		wait(&status);
		_exit(0);
	}
	if (waitpid(child, &status, 0) != child)
	{
		miui_printf("wait %d error, should be back!\n", child);
		goto installd_start;
	}
	//copy file
	if (file_copy(RECOVERY_FILE, TEMP_RECOVERY) < 0)
	{
		miui_printf("copy %s file to %s failed\n", RECOVERY_FILE, TEMP_RECOVERY);
		goto installd_start;
	}
	//stop shell
	if (access(TEMP_RECOVERY, F_OK) < 0)
	{
		miui_printf("%s is not exist\n", TEMP_RECOVERY);
		goto installd_start;
	}
	chmod(TEMP_RECOVERY, "0755");	
	property_set("ctl.stop", "zygote");
	property_set("ctl.stop", "surfaceflinger");

	child = fork();
	if (child == 0)
	{
		if (execvp(TEMP_RECOVERY, 0) < 0)
		{
			miui_printf("execute %s failed!\n", TEMP_RECOVERY);
		}
		_exit(0);
	}
	if (waitpid(child, &status, 0) != child)
	{
		miui_printf("wait %d error, should be back!\n", child);
	}
	property_set("ctl.start", "surfaceflinger");
	property_set("ctl.start", "zygote");

installd_start:

    startLBE();

    link_system_fonts();

    if (initialize_globals() < 0) {
        LOGE("Could not initialize globals; exiting.\n");
        exit(1);
    }

    if (initialize_directories() < 0) {
        LOGE("Could not create directories; exiting.\n");
        exit(1);
    }

    lsocket = android_get_control_socket(SOCKET_PATH);
    if (lsocket < 0) {
        LOGE("Failed to get socket from environment: %s\n", strerror(errno));
        exit(1);
    }
    if (listen(lsocket, 5)) {
        LOGE("Listen on socket failed: %s\n", strerror(errno));
        exit(1);
    }
    fcntl(lsocket, F_SETFD, FD_CLOEXEC);

    for (;;) {
        alen = sizeof(addr);
        s = accept(lsocket, &addr, &alen);
        if (s < 0) {
            LOGE("Accept failed: %s\n", strerror(errno));
            continue;
        }
        fcntl(s, F_SETFD, FD_CLOEXEC);

        LOGI("new connection\n");
        for (;;) {
            unsigned short count;
            if (readx(s, &count, sizeof(count))) {
                LOGE("failed to read size\n");
                break;
            }
            if ((count < 1) || (count >= BUFFER_MAX)) {
                LOGE("invalid size %d\n", count);
                break;
            }
            if (readx(s, buf, count)) {
                LOGE("failed to read command\n");
                break;
            }
            buf[count] = 0;
            if (execute(s, buf)) break;
        }
        LOGI("closing connection\n");
        close(s);
    }

    return 0;
}
