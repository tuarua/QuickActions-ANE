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

import flash.events.EventDispatcher;

public class QuickActionsANE extends EventDispatcher {
    private var _isInited:Boolean;
    private static var _quickActions:QuickActionsANE;

    public function QuickActionsANE() {
        if (_quickActions) {
            throw new Error(QuickActionsANEContext.NAME + " is a singleton, use .quickActions");
        }
        if (QuickActionsANEContext.context) {
            var theRet:* = QuickActionsANEContext.context.call("init");
            if (theRet is ANEError) throw theRet as ANEError;
            _isInited = theRet as Boolean;
        }
        _quickActions = this;
    }

    public static function get quickActions():QuickActionsANE {
        if (_quickActions == null) {
            new QuickActionsANE();
        }
        return _quickActions;
    }

    /** @deprecated set shortcutItems = new Vector.<ShortcutItem>(); instead */
    public function clear():void {
        if (!safetyCheck()) return;
        var ret:* = QuickActionsANEContext.context.call("setShortcutItems", new Vector.<ShortcutItem>());
        if (ret is ANEError) throw ret as ANEError;
    }

    public function get launchShortcut():String {
        if (!safetyCheck()) return null;
        var ret:* = QuickActionsANEContext.context.call("getLaunchShortcut");
        if (ret is ANEError) throw ret as ANEError;
        return ret as String;
    }

    public function set shortcutItems(value:Vector.<ShortcutItem>):void {
        if (!safetyCheck()) return;
        var ret:* = QuickActionsANEContext.context.call("setShortcutItems", value);
        if (ret is ANEError) throw ret as ANEError;
    }

    /** @return whether we have inited */
    public function get isInited():Boolean {
        return _isInited;
    }

    /** @private */
    private function safetyCheck():Boolean {
        if (!_isInited || QuickActionsANEContext.isDisposed) {
            trace("You need to init first");
            return false;
        }
        return true;
    }

    public static function dispose():void {
        if (QuickActionsANEContext.context) {
            QuickActionsANEContext.dispose();
        }
    }
}
}
