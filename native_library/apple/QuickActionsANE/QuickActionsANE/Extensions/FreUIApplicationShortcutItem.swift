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

public extension UIApplicationShortcutItem {
    convenience init?(_ freObject: FREObject?) {
        guard let rv = freObject,
            let type = String(rv["type"]),
            let localizedTitle = String(rv["title"])
            else { return nil }
        var icon: UIApplicationShortcutIcon?
        if let iconId = Int(rv["icon"]), iconId > -1,
            let iconType = UIApplicationShortcutIcon.IconType(rawValue: iconId) {
            icon = UIApplicationShortcutIcon(type: iconType)
        }
        self.init(type: type, localizedTitle: localizedTitle, localizedSubtitle: nil, icon: icon, userInfo: nil)
    }
}

public extension Array where Element == UIApplicationShortcutItem {
    init?(_ freObject: FREObject?) {
        self.init()
        guard let rv = freObject else {
            return
        }
        var ret = [UIApplicationShortcutItem]()
        let array = FREArray(rv)
        for item in array {
            if let v = UIApplicationShortcutItem(item) {
                ret.append(v)
            }
        }
        self = ret
    }
}
