package bridge;

import js.Syntax;

class Platform {
    public var id(get, null):String;
    public var sdk(get, null):String;
    public var language(get, null):String;
    public var payload(get, null):String;
    public var tld(get, null):String;
    public var isGetAllGamesSupported(get, null):Bool;
    public var isGetGameByIdSupported(get, null):Bool;

    var getServerTimeCallback:Int->Void = null;
    var getAllGamesCallback:Any->Void = null;
    var getGameByIdCallback:Any->Void = null;

    public function new() {

    }

    function get_id():String {
        return Syntax.code('bridge.platform.id');
    }

    function get_sdk():Null<String> {
        return Syntax.code('bridge.platform.sdk');
    }

    function get_language():String {
        return Syntax.code('bridge.platform.language');
    }

    function get_payload():Null<String> {
        return Syntax.code('bridge.platform.payload');
    }

    function get_tld():Null<String> {
        return Syntax.code('bridge.platform.tld');
    }

    function get_isGetAllGamesSupported():Bool {
        return Syntax.code('bridge.platform.isGetAllGamesSupported');
    }

    function get_isGetGameByIdSupported():Bool {
        return Syntax.code('bridge.platform.isGetGameByIdSupported');
    }

    public function sendMessage(message:String) {
        Syntax.code('bridge.platform.sendMessage({0})', message);
    }

    public function getServerTime(callback:Int->Void):Void {
        if (getServerTimeCallback != null) return;
        getServerTimeCallback = callback;
        Syntax.code('bridge.platform.getServerTime().then({0}).catch({1})', onGetServerTimeThen, onGetServerTimeCatch);
    }

    function onGetServerTimeThen(result:Int):Void {
        if (getServerTimeCallback != null) {
            if (result is Int) getServerTimeCallback(result);
            else getServerTimeCallback(0);
            getServerTimeCallback = null;
        }
    }

    function onGetServerTimeCatch(error:String) {
        if (getServerTimeCallback != null) {
            getServerTimeCallback(0);
            getServerTimeCallback = null;
        }        
    }

    public function getAllGames(callback:Any->Void) {
        if (getAllGamesCallback != null) return;
        getAllGamesCallback = callback;
        Syntax.code('bridge.platform.getAllGames().then({0})', onGetAllGamesThen);
    }

    function onGetAllGamesThen(data:Any) {
        if (getAllGamesCallback != null) {
            getAllGamesCallback(data);
            getAllGamesCallback = null;
        }
    }

    public function getGameById(options:String, callback:Any->Void) {
        if (getGameByIdCallback != null) return;
        getGameByIdCallback = callback;
        Syntax.code('bridge.platform.getGameById({0}).then({1})', options, onGetGameById);
    }

    function onGetGameById(data:Any) {
        if (getGameByIdCallback != null) {
            getGameByIdCallback(data);
            getGameByIdCallback = null;
        }
    }
}
