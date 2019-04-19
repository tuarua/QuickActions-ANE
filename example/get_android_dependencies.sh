#!/bin/sh

AneVersion="1.2.0"
SupportV4Version="27.1.0"

wget -O android_dependencies/com.tuarua.frekotlin.ane https://github.com/tuarua/Android-ANE-Dependencies/blob/master/anes/kotlin/com.tuarua.frekotlin.ane?raw=true
wget -O android_dependencies/com.android.support.support-v4-$SupportV4Version.ane https://github.com/tuarua/Android-ANE-Dependencies/blob/master/anes/support/com.android.support.support-v4-$SupportV4Version.ane?raw=true
wget -O ../native_extension/ane/QuickActionsANE.ane https://github.com/tuarua/QuickActions-ANE/releases/download/$AneVersion/QuickActionsANE.ane?raw=true
