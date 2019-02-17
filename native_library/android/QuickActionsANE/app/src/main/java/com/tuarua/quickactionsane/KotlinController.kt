/*
 *  Copyright 2018 Tua Rua Ltd.
 *
 *  Licensed under the Apache License, Version 2.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 *
 *  http://www.apache.org/licenses/LICENSE-2.0
 *
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the License for the specific language governing permissions and
 *  limitations under the License.
 */
package com.tuarua.quickactionsane

import android.content.Context
import android.content.pm.ShortcutInfo
import com.adobe.fre.FREContext
import com.adobe.fre.FREObject
import com.tuarua.frekotlin.*
import android.content.pm.ShortcutManager
import android.os.Build
import android.support.annotation.RequiresApi
import com.tuarua.quickactionsane.extensions.ShortcutInfo

@Suppress("unused", "UNUSED_PARAMETER", "UNCHECKED_CAST")
class KotlinController : FreKotlinMainController {
    // https://romannurik.github.io/AndroidAssetStudio/icons-app-shortcut.html#source.type=clipart&source.clipart=search&source.space.trim=0&source.space.pad=0&name=ic_shortcut_search&foreColor=rgb(0%2C%200%2C%200)&backColor=rgb(245%2C%20245%2C%20245)
    fun init(ctx: FREContext, argv: FREArgv): FREObject? {
        return true.toFREObject()
    }

    fun setShortcutItems(ctx: FREContext, argv: FREArgv): FREObject? {
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.N_MR1) {
            return null
        }
        val appActivity = context?.activity ?: return null
        argv.takeIf { argv.size > 0 } ?: return FreArgException("setShortcutItems")

        val items = mutableListOf<ShortcutInfo>()
        val freArray = FREArray(argv[0])
        for (fre in freArray) {
            val si = ShortcutInfo(fre, appActivity) ?: continue
            items.add(si)
        }
        appActivity.applicationContext.shortcutManager().dynamicShortcuts = items
        return null
    }

    fun clearShortcutItems(ctx: FREContext, argv: FREArgv): FREObject? {
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.N_MR1) {
            return null
        }
        val appContext = context?.activity?.applicationContext ?: return null
        appContext.shortcutManager().removeAllDynamicShortcuts()
        return null
    }

    @RequiresApi(Build.VERSION_CODES.N_MR1)
    private fun Context.shortcutManager(): ShortcutManager {
        return this.getSystemService(Context.SHORTCUT_SERVICE) as ShortcutManager
    }

    fun getLaunchShortcut(ctx: FREContext, argv: FREArgv): FREObject? {
        val appActivity = context?.activity ?: return false.toFREObject()
        val prefs = appActivity.getSharedPreferences(appActivity.packageName, 0)
        val shortcutAction = prefs.getString("shortcutAction", null)
        prefs.edit().remove("shortcutAction").apply()
        return shortcutAction?.toFREObject()
    }

    override val TAG: String
        get() = this::class.java.simpleName
    private var _context: FREContext? = null
    override var context: FREContext?
        get() = _context
        set(value) {
            _context = value
            FreKotlinLogger.context = _context
        }
}