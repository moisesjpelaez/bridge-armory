package bridge;

import js.Syntax;

class RemoteConfig {
    public var isSupported(get, null):Bool;
    var getCallback:(Bool, Any)->Void = null;
    var isGetting:Bool = false;

    public function new() {
        
    }

    function get_isSupported():Bool {
        return Syntax.code('bridge.remoteConfig.isSupported');
    }

    public function get(?options:Any = null, ?callback:(Bool, Any)->Void = null) {
        if (isGetting || callback == null) return;
        
        isGetting = true;
        getCallback = callback;
        
        Syntax.code('bridge.remoteConfig.get({0}).then({1}).catch({2})', options, onGetThen, onGetCatch);
    }

    function onGetThen(flags:Any) {
        isGetting = false;
        if (getCallback == null) return;
        getCallback(true, flags);
    }

    function onGetCatch(error:String) {
        isGetting = false;
        if (getCallback == null) return;
        getCallback(false, null);
    }
}