package bridge;

import haxe.Constraints.Function;

/**
	Taken and modified from `armory.system.Event` to send arguments.
    Detailed documentation of the event system:
	[Armory Wiki: Events](https://github.com/armory3d/armory/wiki/events).
**/
class Event {
	static var events = new Map<String, Array<TEvent>>();

	public static function send(name: String, ...args: Any) {
		var entries = get(name);
		if (entries != null) for (e in entries) Reflect.callMethod(e, e.onEvent, args);
	}

	public static function get(name: String): Array<TEvent> {
		return events.get(name);
	}

	public static function add(name: String, onEvent: Function): TEvent {
		var e: TEvent = { name: name, onEvent: onEvent };
		var entries = events.get(name);
		if (entries != null) entries.push(e);
		else events.set(name, [e]);
		return e;
	}

	public static function remove(name: String) {
		events.remove(name);
	}

	public static function removeListener(event: TEvent) {
		var entries = events.get(event.name);
		if (entries != null) {
			entries.remove(event);
			if (entries.length == 0) {
				events.remove(event.name);
			}
		}
	}
}

typedef TEvent = {
	var name: String;
	var onEvent: Function;
}
