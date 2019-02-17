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

#import "FreMacros.h"
#import "QuickActionsANE_oc.h"
#import <QuickActionsANE_FW/QuickActionsANE_FW.h>

#define FRE_OBJC_BRIDGE TRQAA_FlashRuntimeExtensionsBridge
@interface FRE_OBJC_BRIDGE : NSObject<FreSwiftBridgeProtocol>
@end
@implementation FRE_OBJC_BRIDGE {
}
FRE_OBJC_BRIDGE_FUNCS
@end

@implementation QuickActionsANE_LIB
SWIFT_DECL(TRQAA)
CONTEXT_INIT(TRQAA) {
    SWIFT_INITS(TRQAA)
    static FRENamedFunction extensionFunctions[] =
    {
         MAP_FUNCTION(TRQAA, init)
        ,MAP_FUNCTION(TRQAA, setShortcutItems)
        ,MAP_FUNCTION(TRQAA, clearShortcutItems)
        ,MAP_FUNCTION(TRQAA, getLaunchShortcut)
    };
    SET_FUNCTIONS 
}

CONTEXT_FIN(TRQAA) {
    [TRQAA_swft dispose];
    TRQAA_swft = nil;
    TRQAA_freBridge = nil;
    TRQAA_swftBridge = nil;
    TRQAA_funcArray = nil;
}
EXTENSION_INIT(TRQAA)
EXTENSION_FIN(TRQAA)
@end
