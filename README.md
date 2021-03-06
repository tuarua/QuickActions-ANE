# QuickActions-ANE

Add [Home screen quick actions](https://developer.apple.com/design/human-interface-guidelines/ios/extensions/home-screen-actions/) to iOS and [App shortcuts](https://developer.android.com/guide/topics/ui/shortcuts/) to Android with this Adobe Air Native Extension for iOS 9.0+ and Android 25+.    

Supports Apple's [Home Screen Quick Action Icons](https://developer.apple.com/design/human-interface-guidelines/ios/icons-and-images/system-icons/#quick-action-icons) and Material equivalents on Android.

-------------

## Prerequisites

You will need:

- IntelliJ IDEA
- AIR 33.1.1.217+
- Xcode 12.3
- [.Net Core Runtime](https://dotnet.microsoft.com/download/dotnet-core/3.1)
- [AIR-Tools](https://github.com/tuarua/AIR-Tools/)

### The ANE + Dependencies

Change directory into the _example_ folder eg

```bash
cd /MyMac/dev/AIR/QuickActions-ANE/example
```

Run the _"air-tools"_ command (You will need [AIR-Tools](https://github.com/tuarua/AIR-Tools/) installed)

```bash
air-tools install
```


**NEW** This tool now: 

1. Downloads the ANE and dependencies.
1. Applies all required Android Manifest, InfoAdditons and Entitlements to your app.xml. See air package.json


-------------

## iOS

>N.B. You must use a Mac to build an iOS app using this ANE. Windows is **NOT** supported.

#### iOS: Packaging Frameworks Dependencies

The iOS ANEs are written in Swift. We need to package the Swift libraries (along with a couple of dynamic frameworks) with our AIR app

![https://raw.githubusercontent.com/wiki/tuarua/Firebase-ANE/images/frameworks-package.png](https://raw.githubusercontent.com/wiki/tuarua/Firebase-ANE/images/frameworks-package.png)

