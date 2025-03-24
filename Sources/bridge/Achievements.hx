package bridge;

import armory.system.Signal;
import js.Syntax;

class Achievements {
    public var isSupported(get, null):Bool;
    public var isGetListSupported(get, null):Bool;
    public var isNativePopupSupported(get, null):Bool;

    var unlockCallback:Bool->Void = null;
    var getListCallback:(Bool, Map<Any, TAchievementList>)->Void = null;
    var showNativePopupCallback:Bool->Void = null;

    public function new():Void {

    }

    function get_isSupported():Bool {
        return Syntax.code("bridge.achievements.isSupported");
    }

    function get_isGetListSupported():Bool {
        return Syntax.code("bridge.achievements.isGetListSupported");
    }

    function get_isNativePopupSupported():Bool {
        return Syntax.code("bridge.payments.isNativePopupSupported");
    }

    public function unlock(?options:Any = null, ?callback:Bool->Void = null):Void {
        if (unlockCallback != null) return;
        unlockCallback = callback;
        Syntax.code("bridge.achievements.unlock({0}).then({1}).catch({2})", options, onUnlockThen, onUnlockCatch);
    }

    function onUnlockThen():Void {
        if (unlockCallback != null) {
            unlockCallback(true);
            unlockCallback = null;
        }
    }

    function onUnlockCatch(error:String):Void {
        if (unlockCallback != null) {
            unlockCallback(false);
            unlockCallback = null;
        }
    }

    public function getList(?options:Any = null, ?callback:(Bool, Map<Any, TAchievementList>)->Void = null) {
        if (getListCallback != null) return;
        getListCallback = callback;
        Syntax.code("bridge.achievements.getList({0}).then({1}).catch({2})", options, onGetListThen, onGetListCatch);
    }

    function onGetListThen(list:Map<Any, TAchievementList>):Void {
        if (getListCallback != null) {
            getListCallback(true, list);
            getListCallback = null;
        }
    }

    function onGetListCatch(error:String):Void {
        if (getListCallback != null) {
            getListCallback(false, []);
            getListCallback = null;
        }
    }

    public function showNativePopup(?options:Any = null, ?callback:Bool->Void):Void {
        if (showNativePopupCallback != null) return;
        showNativePopupCallback = callback;
        Syntax.code("bridge.achievements.showNativePopup({0}).then({1}).catch({2})", options, onShowNativePopupThen, onShowNativePopupCatch);
    }

    function onShowNativePopupThen():Void {
        if (showNativePopupCallback != null) {
            showNativePopupCallback(true);
            showNativePopupCallback = null;
        }
    }

    function onShowNativePopupCatch(error:String):Void {
        if (showNativePopupCallback != null) {
            showNativePopupCallback(false);
            showNativePopupCallback = null;
        }
    }
}

typedef TAchievementList = { // Untested. Some fields may throw parse error.
    var achievementid:String;
    var achievement:String;
    var achievementkey:String;
    var description:String;
    var icon:String;
    var difficulty:String;
    var secret:Bool;
    var awarded:Bool;
    var game:String;
    var link:String;
    var playerid:String;
    var playername:String;
    var lastUpdated:String;
    var date:String;
    var rDate:String;
}