import common
import edify_generator


def AddAssertions(info):
    edify = info.script
    for i in xrange(len(edify.script)):
        if ");" in edify.script[i] and ("ro.product.device" in edify.script[i] or "ro.build.product" in edify.script[i]):
            edify.script[i] = edify.script[i].replace(");", ' || getprop("ro.product.device") == "u8860" || getprop("ro.build.product") == "u8860");')
        if "unmount(\"/system\")" in edify.script[i]:
            edify.script[i] = edify.script[i].replace("unmount", 'ui_print')
        elif "format" in edify.script[i] and "/dev/block/mmcblk0p2" in edify.script[i]:
            edify.script[i] = edify.script[i].replace("format", 'mount')
            edify.script[i] = edify.script[i].replace("\"0\"", '"/system"')
        elif "mount(\"ext4\", \"EMMC\", \"/dev/block/mmcblk0p2\", \"/system\");" in edify.script[i]:
            edify.script[i] = edify.script[i].replace("mount(\"ext4\", \"EMMC\", \"/dev/block/mmcblk0p2\", \"/system\");", 'delete_recursive("/system/app", "/system/bin", "/system/etc", "/system/fonts", "/system/framework", "/system/lib", "/system/media", "/system/tts", "/system/usr", "/system/vendor", "/system/xbin","/system/build.prop", "0");')
    return 

def FullOTA_InstallEnd(info):
    AddAssertions(info)

def IncrementalOTA_InstallEnd(info):
    AddAssertions(info)
