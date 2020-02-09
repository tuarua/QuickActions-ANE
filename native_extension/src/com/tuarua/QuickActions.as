/* Copyright 2018 Tua Rua Ltd.

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

package com.tuarua {
import com.tuarua.fre.ANEError;
import com.tuarua.quickActions.ShortcutItem;

public class QuickActions {
    private static var _shared:QuickActions;

    public function QuickActions() {
        if (_shared) {
            throw new Error(QuickActionsANEContext.NAME + " is a singleton, use .shared()");
        }
        if (QuickActionsANEContext.context) {
            var ret:* = QuickActionsANEContext.context.call("init");
            if (ret is ANEError) throw ret as ANEError;
        }
        _shared = this;
    }

    public static function shared():QuickActions {
        if (_shared == null) {
            new QuickActions();
        }
        return _shared;
    }

    public function get launchShortcut():String {
        var ret:* = QuickActionsANEContext.context.call("getLaunchShortcut");
        if (ret is ANEError) throw ret as ANEError;
        return ret as String;
    }

    public function set shortcutItems(value:Vector.<ShortcutItem>):void {
        var ret:* = QuickActionsANEContext.context.call("setShortcutItems", value);
        if (ret is ANEError) throw ret as ANEError;
    }

    public static function dispose():void {
        if (QuickActionsANEContext.context) {
            QuickActionsANEContext.dispose();
        }
    }
}
}
