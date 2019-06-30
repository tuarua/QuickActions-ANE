# QuickActions-ANE

Add [Home screen quick actions](https://developer.apple.com/design/human-interface-guidelines/ios/extensions/home-screen-actions/) to iOS and [App shortcuts](https://developer.android.com/guide/topics/ui/shortcuts/) to Android with this Adobe Air Native Extension for iOS 9.0+ and Android 25+.    

Supports Apple's [Home Screen Quick Action Icons](https://developer.apple.com/design/human-interface-guidelines/ios/icons-and-images/system-icons/#quick-action-icons) and Material equivalents on Android.

-------------

## Android

#### The ANE + Dependencies

cd into /example and run:
- macOS (Terminal)
```shell
bash get_android_dependencies.sh
```
- Windows Powershell
```shell
PS get_android_dependencies.ps1
```

```xml
<extensions>
<extensionID>com.tuarua.frekotlin</extensionID>
<extensionID>com.android.support.support-v4</extensionID>
<extensionID>com.tuarua.QuickActionsANE</extensionID>
...
</extensions>
```

You will also need to include the following in your app manifest. Update accordingly.

```xml
<activity android:excludeFromRecents="false" android:hardwareAccelerated="true">
...
    <intent-filter>
        <action android:name="android.intent.action.MAIN" />
        <category android:name="android.intent.category.LAUNCHER" />
    </intent-filter>
...
</activity>

<activity android:name="com.tuarua.quickactionsane.ShortcutHandlerActivity"
    android:theme="@style/Theme.Transparent"
    android:exported="false"/>
```

-------------

## iOS

#### The ANE + Dependencies

N.B. You must use a Mac to build an iOS app using this ANE. Windows is NOT supported.

From the command line cd into /example and run:

```shell
bash get_ios_dependencies.sh
```

This folder, ios_dependencies/device/Frameworks, must be packaged as part of your app when creating the ipa. How this is done will depend on the IDE you are using.
After the ipa is created unzip it and confirm there is a "Frameworks" folder in the root of the .app package.   

### Prerequisites

You will need:

- IntelliJ IDEA / Flash Builder
- AIR 33 or greater
- Android Studio 3 if you wish to edit the Android source
- Xcode 10.1
- wget on macOS
- Powershell on Windows
