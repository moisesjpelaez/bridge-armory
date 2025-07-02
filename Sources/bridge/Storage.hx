package bridge;

import js.Syntax;

class Storage {
    public var defaultType(get, null): String;

    var isGetting: Bool = false;
    var getCallback: (Bool, Dynamic)->Void = null;
    var isSetting: Bool = false;
    var setCallback: Bool->Void = null;
    var isDeleting: Bool = false;
    var deleteCallback: Bool->Void = null;

    public function new() {

    }

    function get_defaultType(): String {
        return Syntax.code('bridge.storage.defaultType');
    }

    public function isSupported(storageType: String): Bool {
        return Syntax.code('bridge.storage.isSupported({0})', storageType);
    }

    public function isAvailable(storageType: String): Bool {
        return Syntax.code('bridge.storage.isAvailable({0})', storageType);
    }

    public function get(key: Any, ?callback: (Bool, Dynamic)->Void = null, ?storageType: String = null) {
        if (isGetting || callback == null) return;
        isGetting = true;
        getCallback = callback;
        Syntax.code('bridge.storage.get({0}, {1}).then({2}).catch({3})', key, storageType, onGetThen, onGetCatch);
    }

    function onGetThen(data: Dynamic) {
        isGetting = false;
        if (getCallback != null) getCallback(true, data);
    }

    function onGetCatch(error: String) {
        isGetting = false;
        if (getCallback != null) getCallback(false, null);
    }

    public function set(key: Any, value: Dynamic, ?callback: Bool->Void = null, ?storageType: String = null) {
        if (isSetting) return;
        isSetting = true;
        setCallback = callback;
        Syntax.code('bridge.storage.set({0}, {1}, {2}).then({3}).catch({4})', key, value, storageType, onSetThen, onSetCatch);
    }

    function onSetThen() {
        isSetting = false;
        if (setCallback != null) setCallback(true);
    }

    function onSetCatch(error: String) {
        isSetting = false;
        if (setCallback != null) setCallback(false);
    }

    public function delete(key: Any, ?callback: Bool->Void = null, ?storageType: String = null) {
        if (isDeleting) return;
        isDeleting = true;
        deleteCallback = callback;
        Syntax.code('bridge.storage.delete({0}, {1}).then({2}).catch({3})', key, storageType, onDeleteThen, onDeleteCatch);
    }

    function onDeleteThen() {
        isDeleting = false;
        if (deleteCallback != null) deleteCallback(true);
    }

    function onDeleteCatch(error: String) {
        isDeleting = false;
        if (deleteCallback != null) deleteCallback(false);
    }
}
