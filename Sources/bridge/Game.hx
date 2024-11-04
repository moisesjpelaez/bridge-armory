package bridge;

import arm.temp.Signal;
import js.Syntax;

class Game {
    public var visibilityStateChanged:Signal = new Signal();
    public var visibilityState(get, null):String;

    public function new() {
        Syntax.code('bridge.game.on(bridge.EVENT_NAME.VISIBILITY_STATE_CHANGED, {0})', onVisibilityStateChanged);
    }

    function get_visibilityState():String {
        return Syntax.code('bridge.game.visibilityState');
    }

    function onVisibilityStateChanged(state:String) {
        visibilityStateChanged.emit(state);
    }
}
