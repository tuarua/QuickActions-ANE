package {

import com.tuarua.QuickActionsANE;
import com.tuarua.quickActions.ShortcutItem;
import com.tuarua.quickActions.ShortcutItemIcon;

import flash.desktop.NativeApplication;
import flash.events.Event;
import flash.utils.setInterval;

import starling.display.Sprite;
import starling.events.Touch;
import starling.events.TouchEvent;
import starling.events.TouchPhase;
import starling.text.TextField;
import starling.utils.Align;

import views.SimpleButton;

public class StarlingRoot extends Sprite {
    private var setItemsBtn:SimpleButton = new SimpleButton("Set Shortcut Items");
    private var clearItemsBtn:SimpleButton = new SimpleButton("Clear Shortcut Items");
    private var statusLabel:TextField;
    private var quickActions:QuickActionsANE;

    public function StarlingRoot() {
        super();
        TextField.registerCompositor(Fonts.getFont("fira-sans-semi-bold-13"), "Fira Sans Semi-Bold 13");
        NativeApplication.nativeApplication.addEventListener(Event.EXITING, onExiting);
    }

    private function onActivate(event:Event):void {
        var launchShortcut:String = quickActions.launchShortcut;
        if (launchShortcut != null) {
            statusLabel.text = "onActivate Shortcut: " + launchShortcut;
        } else {
            statusLabel.text = "";
        }
    }

    public function start():void {
        initMenu();
        quickActions = QuickActionsANE.quickActions;
        var launchShortcut:String = quickActions.launchShortcut;
        if (launchShortcut != null) {
            statusLabel.text = "Launch Shortcut: " + launchShortcut;
        }
        NativeApplication.nativeApplication.addEventListener(Event.ACTIVATE, onActivate);
    }

    private function initMenu():void {
        setItemsBtn.y = 100;
        clearItemsBtn.y = 180;
        setItemsBtn.addEventListener(TouchEvent.TOUCH, onSetItemsTouch);
        clearItemsBtn.addEventListener(TouchEvent.TOUCH, onClearItemsTouch);

        clearItemsBtn.x = setItemsBtn.x = (stage.stageWidth - 200) / 2;

        addChild(setItemsBtn);
        addChild(clearItemsBtn);

        statusLabel = new TextField(stage.stageWidth, 100, "");
        statusLabel.format.setTo(Fonts.NAME, 13, 0x222222, Align.CENTER, Align.TOP);
        statusLabel.touchable = false;
        statusLabel.y = clearItemsBtn.y + 75;
        addChild(statusLabel);
    }

    private function onSetItemsTouch(event:TouchEvent):void {
        event.stopPropagation();
        var touch:Touch = event.getTouch(setItemsBtn, TouchPhase.ENDED);
        if (touch && touch.phase == TouchPhase.ENDED) {
            var shortcutItems:Vector.<ShortcutItem> = new Vector.<ShortcutItem>();
            shortcutItems.push(new ShortcutItem("action_home", "Home", ShortcutItemIcon.home));
            shortcutItems.push(new ShortcutItem("action_favourites", "Favourites", ShortcutItemIcon.favorite));
            shortcutItems.push(new ShortcutItem("action_search", "Search", ShortcutItemIcon.search));
            quickActions.shortcutItems = shortcutItems;
        }
    }

    private function onClearItemsTouch(event:TouchEvent):void {
        event.stopPropagation();
        var touch:Touch = event.getTouch(clearItemsBtn, TouchPhase.ENDED);
        if (touch && touch.phase == TouchPhase.ENDED) {
            quickActions.clear();
        }
    }

    private function onExiting(event:Event):void {
        QuickActionsANE.dispose();
    }

}
}
