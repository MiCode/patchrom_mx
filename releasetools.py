import common
import edify_generator


def AddAssertions(info):
    info.script.AppendExtra('set_perm_recursive(0, 2000, 06755, 06755, "/system/xbin");');
    edify = info.script
    for i in xrange(len(edify.script)):
        if "unmount(\"/system\")" in edify.script[i]:
            edify.script[i] = edify.script[i].replace("unmount", 'ui_print')
        elif "format" in edify.script[i] and "/dev/block/mmcblk0p2" in edify.script[i]:
            edify.script[i] = edify.script[i].replace("format(\"ext4\", \"EMMC\", \"/dev/block/mmcblk0p2\", \"0\");", 'delete_recursive("/system/app", "/system/bin", "/system/etc", "/system/fonts", "/system/framework", "/system/lib", "/system/media", "/system/tts", "/system/usr", "/system/vendor", "/system/xbin","/system/build.prop", "0");')
    return 

def FullOTA_InstallEnd(info):
    AddAssertions(info)

def IncrementalOTA_InstallEnd(info):
    AddAssertions(info)
