package bridge;

import js.Syntax;

class Leaderboard {
    public var isSupported(get, null):Bool;
    public var isNativePopupSupported(get, null):Bool;
    public var isSetScoreSupported(get, null):Bool;
    public var isGetScoreSupported(get, null):Bool;
    public var isGetEntriesSupported(get, null):Bool;

    var showNativePopupCallback:Bool->Void = null;
    var setScoreCallback:Bool->Void = null;
    var getScoreCallback:(Bool, Int)->Void = null;
    var getEntriesCallback:(Bool, Map<Any, TEntry>)->Void = null;

    public function new() {
        
    }

    function get_isSupported():Bool {
        return Syntax.code('bridge.leaderboard.isSupported');
    }

    function get_isNativePopupSupported():Bool {
        return Syntax.code('bridge.leaderboard.isNativePopupSupported');
    }

    function get_isSetScoreSupported():Bool {
        return Syntax.code('bridge.leaderboard.isSetScoreSupported');
    }

    function get_isGetScoreSupported():Bool {
        return Syntax.code('bridge.leaderboard.isGetScoreSupported');
    }

    function get_isGetEntriesSupported():Bool {
        return Syntax.code('bridge.leaderboard.isGetEntriesSupported');
    }

    public function showNativePopup(options:Any, callback:Bool->Void) {
        if (showNativePopupCallback != null) return;
        showNativePopupCallback = callback;
        Syntax.code('bridge.leaderboard.showNativePopup({0}).then({1}).catch({2})', options, onShowNativePopupThen, onShowNativePopupCatch);
    }

    function onShowNativePopupThen() {
        if (showNativePopupCallback != null) {
            showNativePopupCallback(true);
            showNativePopupCallback = null;
        }
    }

    function onShowNativePopupCatch(error:String) {
        if (showNativePopupCallback != null) {
            showNativePopupCallback(false);
            showNativePopupCallback = null;
        }
    }

    public function setScore(options:Any, callback:Bool->Void) {
        if (setScoreCallback != null) return;
        setScoreCallback = callback;
        Syntax.code('bridge.leaderboard.setScore({0}).then({1}).catch({2})', options, onSetScoreThen, onSetScoreCatch);
    }

    function onSetScoreThen() {
        if (setScoreCallback != null) {
            setScoreCallback(true);
            setScoreCallback = null;
        }
    }

    function onSetScoreCatch(error:String) {
        if (setScoreCallback != null) {
            setScoreCallback(false);
            setScoreCallback = null;
        }
    }

    public function getScore(options:Any, callback:(Bool, Int)->Void) {
        if (getScoreCallback != null) return;
        getScoreCallback = callback;
        Syntax.code('bridge.leaderboard.getScore({0}).then({1}).catch({2})', options, onGetScoreThen, onGetScoreCatch);
    }

    function onGetScoreThen(score:Int) {
        if (getScoreCallback != null) {
            getScoreCallback(true, score);
            getScoreCallback = null;
        }
    }

    function onGetScoreCatch(error:String) {
        if (getScoreCallback != null) {
            getScoreCallback(false, 0);
            getScoreCallback = null;
        }
    }

    public function getEntries(options:Any, callback:(Bool, Map<Any, TEntry>)->Void) {
        if (getEntriesCallback != null) return;
        getEntriesCallback = callback;
        Syntax.code('bridge.leaderboard.getEntries({0}).then({1}).catch({2})', options, onGetEntriesThen, onGetEntriesCatch);
    }

    function onGetEntriesThen(entries:Map<Any, TEntry>) {
        if (getEntriesCallback != null) {
            getEntriesCallback(true, entries);
            getEntriesCallback = null;
        }
    }

    function onGetEntriesCatch(error:String) {
        if (getEntriesCallback != null) {
            getEntriesCallback(false, []);
            getEntriesCallback = null;
        }
    }
}

typedef TEntry = {
    var id:String;
    var score:Int;
    var rank:Int;
    var name:String;
    var photos:Array<String>;
}
