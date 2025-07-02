package bridge;

import js.Syntax;

class Leaderboards {
    var setScoreCallback: Bool->Void = null;
    var getEntriesCallback: (Bool, Map<Any, TEntry>)->Void = null;

    public function new() {

    }

    public function setScore(id: String, score: Int, ?callback: Bool->Void = null) {
        if (setScoreCallback != null) return;
        setScoreCallback = callback;
        Syntax.code('bridge.leaderboard.setScore({0}, {1}).then({2}).catch({3})', id, score, onSetScoreThen, onSetScoreCatch);
    }

    function onSetScoreThen() {
        if (setScoreCallback != null) {
            setScoreCallback(true);
            setScoreCallback = null;
        }
    }

    function onSetScoreCatch(error: String) {
        if (setScoreCallback != null) {
            setScoreCallback(false);
            setScoreCallback = null;
        }
    }

    public function getEntries(id: String, ?callback: (Bool, Map<Any, TEntry>)->Void = null) {
        if (getEntriesCallback != null) return;
        getEntriesCallback = callback;
        Syntax.code('bridge.leaderboard.getEntries({0}).then({1}).catch({2})', id, onGetEntriesThen, onGetEntriesCatch);
    }

    function onGetEntriesThen(entries: Map<Any, TEntry>) {
        if (getEntriesCallback != null) {
            getEntriesCallback(true, entries);
            getEntriesCallback = null;
        }
    }

    function onGetEntriesCatch(error: String) {
        if (getEntriesCallback != null) {
            getEntriesCallback(false, []);
            getEntriesCallback = null;
        }
    }
}

typedef TEntry = {
    var id: String;
    var name: String;
    var photo: String;
    var score: Int;
    var rank: Int;
}
