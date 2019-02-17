/* Copyright 2019 Tua Rua Ltd.
 
 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at
 
 http://www.apache.org/licenses/LICENSE-2.0
 
 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
 */

import Foundation
import FreSwift

public class SwiftController: NSObject {
    public static var TAG = "QuickActionsANE"
    public var context: FreContextSwift!
    public var functionsToSet: FREFunctionMap = [:]
    internal var appDidFinishLaunchingNotification: Notification?
    internal var appBecomeActiveNotification: Notification?
    
    func initController(ctx: FREContext, argc: FREArgc, argv: FREArgv) -> FREObject? {
        return true.toFREObject()
    }
    
    func clearShortcutItems(ctx: FREContext, argc: FREArgc, argv: FREArgv) -> FREObject? {
        UIApplication.shared.shortcutItems = []
        return nil
    }
    
    func setShortcutItems(ctx: FREContext, argc: FREArgc, argv: FREArgv) -> FREObject? {
        guard argc > 0,
            let items = [UIApplicationShortcutItem](argv[0])
            else {
                return FreArgError(message: "setShortcutItems").getError(#file, #line, #column)
        }
        UIApplication.shared.shortcutItems = items
        return nil
    }
    
    func getLaunchShortcut(ctx: FREContext, argc: FREArgc, argv: FREArgv) -> FREObject? {
        var ret: FREObject? = nil
        if let userInfo = appDidFinishLaunchingNotification?.userInfo,
            let shortcutItem = userInfo[UIApplication.LaunchOptionsKey.shortcutItem] as? UIApplicationShortcutItem {
            ret = shortcutItem.type.toFREObject()
        } else if let userInfo = appBecomeActiveNotification?.userInfo,
            let shortcutItem = userInfo[UIApplication.LaunchOptionsKey.shortcutItem] as? UIApplicationShortcutItem {
            ret = shortcutItem.type.toFREObject()
        }
        appDidFinishLaunchingNotification = nil
        appBecomeActiveNotification = nil
        return ret
    }
}
