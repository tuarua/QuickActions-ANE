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

@file:Suppress("FunctionName")

package com.tuarua.quickactionsane.extensions

import android.app.Activity
import android.content.pm.ShortcutInfo
import android.os.Build
import android.support.annotation.RequiresApi
import com.adobe.fre.FREObject
import com.tuarua.frekotlin.*
import android.content.Intent
import android.graphics.drawable.Icon
import com.tuarua.quickactionsane.R
import com.tuarua.quickactionsane.ShortcutHandlerActivity

@Suppress("FunctionName")
@RequiresApi(Build.VERSION_CODES.N_MR1)
fun ShortcutInfo(freObject: FREObject?, appActivity: Activity): ShortcutInfo? {
    val rv = freObject ?: return null
    val type = String(rv["type"]) ?: return null
    val title = String(rv["title"]) ?: return null
    val iconId = Int(rv["icon"])
    val builder = ShortcutInfo.Builder(appActivity.applicationContext, type)
    builder.setLongLabel(title)
    builder.setShortLabel(title)

    if (iconId != null && iconId > -1) {
        val icon = mapIconToId(iconId)
        if (icon != null) {
            builder.setIcon(Icon.createWithResource(appActivity.applicationContext, icon))
        }
    }

    val mainIntent = appActivity.packageManager.getLaunchIntentForPackage(appActivity.packageName)
    val intent = Intent(appActivity.applicationContext, ShortcutHandlerActivity::class.java)
    intent.action = "${appActivity.packageName}.shortCut.$type"
    builder.setIntents(arrayOf(mainIntent, intent))

    return builder.build()
}

fun mapIconToId(value: Int): Int? {
    return when (value) {
        0 -> R.drawable.ic_compose
        1 -> R.drawable.ic_play
        2 -> R.drawable.ic_pause
        3 -> R.drawable.ic_add
        4 -> R.drawable.ic_location
        5 -> R.drawable.ic_search
        6 -> R.drawable.ic_share
        7 -> R.drawable.ic_prohibit
        8 -> R.drawable.ic_contact
        9 -> R.drawable.ic_home
        10 -> R.drawable.ic_marklocation
        11 -> R.drawable.ic_favorite
        12 -> R.drawable.ic_love
        13 -> R.drawable.ic_cloud
        14 -> R.drawable.ic_invitation
        15 -> R.drawable.ic_confirmation
        16 -> R.drawable.ic_mail
        17 -> R.drawable.ic_message
        18 -> R.drawable.ic_date
        19 -> R.drawable.ic_time
        20 -> R.drawable.ic_capturephoto
        21 -> R.drawable.ic_capturevideo
        22 -> R.drawable.ic_task
        23 -> R.drawable.ic_taskcompleted
        24 -> R.drawable.ic_alarm
        25 -> R.drawable.ic_bookmark
        26 -> R.drawable.ic_shuffle
        27 -> R.drawable.ic_audio
        28 -> R.drawable.ic_update
        else -> null
    }
}