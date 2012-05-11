#
# Makefile for mx
#

# The original zip file, MUST be specified by each product
local-zip-file     := stockrom.zip

# The output zip file of MIUI rom, the default is porting_miui.zip if not specified
local-out-zip-file := MIUI_mx.zip

#
#local-miui-modified-apps := MiuiSystemUI MiuiHome Mms Phone Settings
#Updater 
local-miui-modified-apps := MiuiSystemUI

# All apps from original ZIP, but has smali files chanded
local-modified-apps := SettingsProvider

# All apks from MIUI
local-miui-removed-apps     := SettingsProvider MediaProvider Stk Bluetooth

# All apps need to be removed from original ZIP file
local-remove-apps := AllBackup SystemUI SetupWizard Cloud NotePad HwIME Superuser MusicFx Launcher2 FileManager HwOUC \
	rootexplorer GenieWidget GalleryGoogle CalendarGoogle GoogleQuickSearchBox GooglePackageVerifier GooglePackageVerifierUpdater \
	GoogleTTS GooglePlayMusic TotemWeather Trebuchet ToolBox Maps VoiceSearch Talk Vending Gallery2 GoogleTranslate \
	PinyinIME Street PhaseBeam

# To include the local targets before and after zip the final ZIP file, 
# and the local-targets should:
# (1) be defined after including porting.mk if using any global variable(see porting.mk)
# (2) the name should be leaded with local- to prevent any conflict with global targets
# pre-zip for honor
local-pre-zip := local-zip-misc
local-after-zip:=

# The local targets after the zip file is generated, could include 'zip2sd' to 
# deliver the zip file to phone, or to customize other actions

include $(PORT_BUILD)/porting.mk

# To define any local-target
local-zip-misc:
	rm $(ZIP_DIR)/system/framework/twframework-res.apk
	#rm -rf $(ZIP_DIR)/system/cdrom
	cp other/build.prop $(ZIP_DIR)/system/build.prop
	#for release version
	cp other/recovery/recovery $(ZIP_DIR)/system/bin/recovery
	#for dbug version
	#cp $(ANDROID_OUT)/system/bin/recovery $(ZIP_DIR)/system/bin/recovery
	cp other/recovery/res $(ZIP_DIR)/system/media/res -rf
	cp other/recovery/recovery.fstab $(ZIP_DIR)/system/etc/recovery.fstab
	#for release version
	cp other/installd/installd $(ZIP_DIR)/system/bin/installd
	#for debug version
	#cp $(ANDROID_OUT)/system/bin/installd $(ZIP_DIR)/system/bin/installd
