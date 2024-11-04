package bridge;

import js.Syntax;

class Social {
    public var isShareSupported(get, null):Bool;
    public var isJoinCommunitySupported(get, null):Bool;
    public var isInviteFriendsSupported(get, null):Bool;
    public var isCreatePostSupported(get, null):Bool;
    public var isAddToFavoritesSupported(get, null):Bool;
    public var isAddToHomeScreenSupported(get, null):Bool;
    public var isRateSupported(get, null):Bool;
    public var isExternalLinksAllowed(get, null):Bool;

    var shareCallback:Bool->Void = null;
    var joinCommunityCallback:Bool->Void = null;
    var inviteFriendsCallback:Bool->Void = null;
    var createPostCallback:Bool->Void = null;
    var addToFavoritesCallback:Bool->Void = null;
    var addToHomeScreenCallback:Bool->Void = null;
    var rateCallback:Bool->Void = null;

    public function new() {
        
    }

    function get_isShareSupported():Bool {
        return Syntax.code('bridge.social.isShareSupported');
    }

    function get_isJoinCommunitySupported():Bool {
        return Syntax.code('bridge.social.isJoinCommunitySupported');
    }

    function get_isInviteFriendsSupported():Bool {
        return Syntax.code('bridge.social.isInviteFriendsSupported');
    }

    function get_isCreatePostSupported():Bool {
        return Syntax.code('bridge.social.isCreatePostSupported');
    }

    function get_isAddToFavoritesSupported():Bool {
        return Syntax.code('bridge.social.isAddToFavoritesSupported');
    }

    function get_isAddToHomeScreenSupported():Bool {
        return Syntax.code('bridge.social.isAddToHomeScreenSupported');
    }

    function get_isRateSupported():Bool {
        return Syntax.code('bridge.social.isRateSupported');
    }

    function get_isExternalLinksAllowed():Bool {
        return Syntax.code('bridge.social.isExternalLinksAllowed');
    }

    public function share(?options:Any = null, ?callback:Bool->Void = null) {
        if (shareCallback != null) return;
        shareCallback = callback;
        Syntax.code('bridge.social.share({0}).then({1}).catch({2})', options, onShareThen, onShareCatch);
    }

    function onShareThen() {
        if (shareCallback != null) {
            shareCallback(true);
            shareCallback = null;
        }
    }

    function onShareCatch(error:String) {
        if (shareCallback != null) {
            shareCallback(false);
            shareCallback = null;
        }
    }

    public function joinCommunity(?options:Any = null, ?callback:Bool->Void = null) {
        if (joinCommunityCallback != null) return;
        joinCommunityCallback = callback;
        Syntax.code('bridge.social.joinCommunity({0}).then({1}).catch({2})', options, onJoinCommunityThen, onJoinCommunityCatch);
    }

    function onJoinCommunityThen() {
        if (joinCommunityCallback != null) {
            joinCommunityCallback(true);
            joinCommunityCallback = null;
        }
    }

    function onJoinCommunityCatch(error:String) {
        if (joinCommunityCallback != null) {
            joinCommunityCallback(false);
            joinCommunityCallback = null;
        }
    }

    public function inviteFriends(?options:Any = null, ?callback:Bool->Void = null) {
        if (inviteFriendsCallback != null) return;
        inviteFriendsCallback = callback;
        Syntax.code('bridge.social.inviteFriends({0}).then({1}).catch({2})', options, onInviteFriendsThen, onInviteFriendsCatch);
    }

    function onInviteFriendsThen() {
        if (inviteFriendsCallback != null) {
            inviteFriendsCallback(true);
            inviteFriendsCallback = null;
        }
    }

    function onInviteFriendsCatch(error:String) {
        if (inviteFriendsCallback != null) {
            inviteFriendsCallback(false);
            inviteFriendsCallback = null;
        }
    }

    public function createPost(?options:Any = null, ?callback:Bool->Void = null) {
        if (createPostCallback != null) return;
        createPostCallback = callback;
        Syntax.code('bridge.social.createPost({0}).then({1}).catch({2})', options, onCreatePostThen, onCreatePostCatch);
    }

    function onCreatePostThen() {
        if (createPostCallback != null) {
            createPostCallback(true);
            createPostCallback = null;
        }
    }

    function onCreatePostCatch(error:String) {
        if (createPostCallback != null) {
            createPostCallback(false);
            createPostCallback = null;
        }
    }

    public function addToFavorites(?callback:Bool->Void = null) {
        if (addToFavoritesCallback != null) return;
        addToFavoritesCallback = callback;
        Syntax.code('bridge.social.addToFavorites().then({0}).catch({1})', onAddToFavoritesThen, onAddToFavoritesCatch);
    }

    function onAddToFavoritesThen() {
        if (addToFavoritesCallback != null) {
            addToFavoritesCallback(true);
            addToFavoritesCallback = null;
        }
    }

    function onAddToFavoritesCatch(error:String) {
        if (addToFavoritesCallback != null) {
            addToFavoritesCallback(false);
            addToFavoritesCallback = null;
        }
    }

    public function addToHomeScreen(?callback:Bool->Void = null) {
        if (addToHomeScreenCallback != null) return;
        addToHomeScreenCallback = callback;
        Syntax.code('bridge.social.addToHomeScreen().then({0}).catch({1})', onAddToHomeScreenThen, onAddToHomeScreenCatch);
    }

    function onAddToHomeScreenThen() {
        if (addToHomeScreenCallback != null) {
            addToHomeScreenCallback(true);
            addToHomeScreenCallback = null;
        }
    }

    function onAddToHomeScreenCatch(error:String) {
        if (addToHomeScreenCallback != null) {
            addToHomeScreenCallback(false);
            addToHomeScreenCallback = null;
        }
    }

    public function rate(?callback:Bool->Void = null) {
        if (rateCallback != null) return;
        rateCallback = callback;
        Syntax.code('bridge.social.rate().then({0}).catch({1})', onRateThen, onRateCatch);
    }

    function onRateThen() {
        if (rateCallback != null) {
            rateCallback(true);
            rateCallback = null;
        }
    }

    function onRateCatch(error:String) {
        if (rateCallback != null) {
            rateCallback(false);
            rateCallback = null;
        }
    }
}
