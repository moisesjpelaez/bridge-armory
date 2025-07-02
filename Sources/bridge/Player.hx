package bridge;

import js.Syntax;

class Player {
    public var isAuthorizationSupported(get, null): Bool;
    public var isAuthorized(get, null): Bool;
    public var id(get, null): String;
    public var name(get, null): String;
    public var photos(get, null): Array<Any>;

    var authorizeCallback: Bool->Void = null;

    public function new() {

    }

    function get_isAuthorizationSupported(): Bool {
        return Syntax.code('bridge.player.isAuthorizationSupported');
    }

    function get_isAuthorized(): Bool {
        return Syntax.code('bridge.player.isAuthorized');
    }

    function get_id(): String {
        return Syntax.code('bridge.player.id');
    }

    function get_name(): String {
        return Syntax.code('bridge.player.name');
    }

    function get_photos(): Array<Any> {
        return Syntax.code('bridge.player.photos');
    }

    public function authorize(?options: Any = null, ?callback: Bool->Void = null) {
        if (authorizeCallback != null) return;
        authorizeCallback = callback;
        Syntax.code("bridge.player.authorize({0}).then({1}).catch({2})", options, onAuthorizeThen, onAuthorizeCatch);
    }

    function onAuthorizeThen() {
        if (authorizeCallback != null) {
            authorizeCallback(true);
            authorizeCallback = null;
        }
    }

    function onAuthorizeCatch(error: String) {
        if (authorizeCallback != null) {
            authorizeCallback(false);
            authorizeCallback = null;
        }
    }
}
