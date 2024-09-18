package bridge;

import js.Syntax;

class Advertisement {
    public var minimumDelayBetweenInterstitial(get, null):Int;
    public var isBannerSupported(get, null):Bool;
    public var bannerState(get, null):String;
    public var interstitialState(get, null):String;
    public var rewardedState(get, null):String;

    var checkAdBlockCallback:Bool->Void = null;

    public function new() {
        Syntax.code('bridge.advertisement.on(bridge.EVENT_NAME.BANNER_STATE_CHANGED, {0})', onBannerStateChanged);
        Syntax.code('bridge.advertisement.on(bridge.EVENT_NAME.INTERSTITIAL_STATE_CHANGED, {0})', onInterstitialStateChanged);
        Syntax.code('bridge.advertisement.on(bridge.EVENT_NAME.REWARDED_STATE_CHANGED, {0})', onRewardedStateChanged);
    }

    function get_minimumDelayBetweenInterstitial():Int {
        return Syntax.code('bridge.advertisement.minimumDelayBetweenInterstitial');
    }

    function setMinimumDelayBetweenInterstitial(time:Int) {
        Syntax.code('bridge.advertisement.setMinimumDelayBetweenInterstitial({0})', time);
    }

    function get_isBannerSupported():Bool {
        return Syntax.code('bridge.advertisement.isBannerSupported');
    }

    function get_bannerState():String {
        return Syntax.code('bridge.advertisement.bannerState');
    }

    function get_interstitialState():String {
        return Syntax.code('bridge.advertisement.interstitialState');
    }

    function get_rewardedState():String {
        return Syntax.code('bridge.advertisement.rewardedState');
    }

    public function showBanner(options:Any) {
        Syntax.code('bridge.advertisement.showBanner({0})', options);
    }

    public function hideBanner() {
        Syntax.code('bridge.advertisement.hideBanner()');
    }

    public function showInterstitial() {
        Syntax.code('bridge.advertisement.showInterstitial()');
    }

    public function showRewarded() {
        Syntax.code('bridge.advertisement.showRewarded()');
    }

    public function checkAdBlock(callback:Bool->Void) {
        checkAdBlockCallback = callback;
        Syntax.code('bridge.advertisement.checkAdBlock().then({0}).catch({1})', onCheckAdBlockThen, onCheckAdBlockCatch);
    }

    function onBannerStateChanged(state:String) {
        Event.send("BannerStateChanged", state);
    }

    function onInterstitialStateChanged(state:String) {
        Event.send("InterstitialStateChanged", state);
    }

    function onRewardedStateChanged(state:String) {
        Event.send("RewardedStateChanged", state);
    }

    function onCheckAdBlockThen(result:Bool) {
        if (checkAdBlockCallback != null) {
            if (result is Bool) checkAdBlockCallback(result);
            else checkAdBlockCallback(false);
            checkAdBlockCallback = null;
        }
    }

    function onCheckAdBlockCatch(error:String) {
        if (checkAdBlockCallback != null) {
            checkAdBlockCallback(false);
            checkAdBlockCallback = null;
        }
    }
}