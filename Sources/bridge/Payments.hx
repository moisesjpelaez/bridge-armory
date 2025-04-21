package bridge;

import js.Syntax;
import kha.FastFloat;

class Payments {
    public var isSupported(get, null):Bool;

    var purchaseCallback:(Bool, Map<Any, TPurchaseResult>)->Void = null;
    var consumePurchaseCallback:Bool->Void = null;
    var getCatalogCallback:(Bool, Map<Any, TCatalogItem>)->Void = null;
    var getPurchasesCallback:(Bool, Map<Any, TPurchase>)->Void = null;

    public function new() {
        
    }

    function get_isSupported():Bool {
        return Syntax.code('bridge.payments.isSupported');
    }

    public function purchase(id:String, ?callback:(Bool, Map<Any, TPurchaseResult>)->Void = null) {
        if (purchaseCallback != null) return;
        purchaseCallback = callback;
        Syntax.code('bridge.payments.purchase({0}).then({1}).catch({2})', id, onPurchaseThen, onPurchaseCatch);
    }

    function onPurchaseThen(details:Map<Any, TPurchaseResult>) {
        if (purchaseCallback != null) {
            purchaseCallback(true, details);
            purchaseCallback = null;
        }
    }

    function onPurchaseCatch(error:String) {
        if (purchaseCallback != null) {
            purchaseCallback(false, []);
            purchaseCallback = null;
        }
    }

    public function consumePurchase(id:String, ?callback:Bool->Void = null) {
        if (consumePurchaseCallback != null) return;
        consumePurchaseCallback = callback;
        Syntax.code('bridge.payments.consumePurchase({0}).then({1}).catch({2})', id, onConsumePurchaseThen, onConsumePurchaseCatch);
    }

    function onConsumePurchaseThen() {
        if (consumePurchaseCallback != null) {
            consumePurchaseCallback(true);
            consumePurchaseCallback = null;
        }
    }

    function onConsumePurchaseCatch(error:String) {
        if (purchaseCallback != null) {
            consumePurchaseCallback(false);
            purchaseCallback = null;
        }
    }

    public function getCatalog(?callback:(Bool, Map<Any, TCatalogItem>)->Void = null) {
        if (getCatalogCallback != null) return;
        getCatalogCallback = callback;
        Syntax.code('bridge.payments.getCatalog().then({0}).catch({1})', onGetCatalogThen, onGetCatalogCatch);
    }

    function onGetCatalogThen(entries:Map<Any, TCatalogItem>) {
        if (getCatalogCallback != null) {
            getCatalogCallback(true, entries);
            getCatalogCallback = null;
        }
    }

    function onGetCatalogCatch(error:String) {
        if (getCatalogCallback != null) {
            getCatalogCallback(false, []);
            getCatalogCallback = null;
        }
    }
    
    public function getPurchases(?callback:(Bool, Map<Any, TPurchase>)->Void = null) {
        if (getPurchasesCallback != null) return;
        getPurchasesCallback = callback;
        Syntax.code('bridge.payments.getPurchases().then({0}).catch({1})', onGetPurchasesThen, onGetPurchasesCatch);
    }

    function onGetPurchasesThen(entries:Map<Any, TPurchase>) {
        if (getPurchasesCallback != null) {
            getPurchasesCallback(true, entries);
            getPurchasesCallback = null;
        }
    }

    function onGetPurchasesCatch(error:String) {
        if (getPurchasesCallback != null) {
            getPurchasesCallback(false, []);
            getPurchasesCallback = null;
        }
    }
}

typedef TCatalogItem = {
    var id:String;
    var title:String;
    var description:String;
    var imageURI:String;
    var price:FastFloat;
    var priceCurrencyCode:String;
    var priceCurrencyImage:String;
    var priceValue:FastFloat;
}

typedef TPurchase = {
    var productID:String;
    var purchaseToken:String;
}

typedef TPurchaseResult = {
    var developerPayload:String;
    var productID:String;
    var purchaseToken:String;
}