#!/bin/sh

AneVersion="1.5.0"
FreKotlinVersion="1.10.0"
SupportV4Version="1.0.0"

wget -O android_dependencies/com.tuarua.frekotlin-$FreKotlinVersion.ane https://github.com/tuarua/Android-ANE-Dependencies/blob/master/anes/kotlin/com.tuarua.frekotlin-$FreKotlinVersion.ane?raw=true
wget -O android_dependencies/androidx.legacy.legacy-support-v4-$SupportV4Version.ane https://github.com/tuarua/Android-ANE-Dependencies/blob/master/anes/support/androidx.legacy.legacy-support-v4-$SupportV4Version.ane?raw=true
wget -O ../native_extension/ane/QuickActionsANE.ane https://github.com/tuarua/QuickActions-ANE/releases/download/$AneVersion/QuickActionsANE.ane?raw=true
