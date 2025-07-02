package bridge;

import js.Syntax;

class Device {
    public var type(get, null): String;

    public function new() {

    }

    function get_type(): String {
        return Syntax.code('bridge.device.type');
    }
}