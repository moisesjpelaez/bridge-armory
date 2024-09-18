package bridge;

import js.Syntax;

class Platform {
    public var id(get, null):String;
    public var sdk(get, null):String;
    public var language(get, null):String;
    public var payload(get, null):String;
    public var tld(get, null):String;

    var getServerTimeCallback:Int->Void = null;

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
}
