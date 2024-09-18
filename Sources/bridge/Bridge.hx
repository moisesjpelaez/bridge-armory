package bridge;

class Bridge {
    public static var platform:Platform = new Platform();
    public static var device:Device = new Device();
    public static var player:Player = new Player();
    public static var game:Game = new Game();
    public static var storage:Storage = new Storage();
    public static var advertisement:Advertisement = new Advertisement();
    public static var social:Social = new Social();
    public static var leaderboard:Leaderboard = new Leaderboard();
    public static var payments:Payments = new Payments();
    public static var remoteConfig:RemoteConfig = new RemoteConfig();

    function new() {
        
    }
}
