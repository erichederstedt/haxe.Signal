package haxe;

import haxe.Constraints.Function;

class SignalData<T:Function> {
	public var listeners:Array<T>;

	public function new() {
		listeners = [];
	}
}

abstract Signal<T:Function>(SignalData<T>) {
	public function new() {
		this = new SignalData<T>();
	}

	@:op(A += B)
	public inline function add(listener:T):Void {
		this.listeners.push(listener);
	}

	@:op(A -= B)
	public inline function remove(listener:T):Void {
		this.listeners.remove(listener);
	}

	@:op(a())
	public inline function dispatch(...args:Dynamic):Void {
		for (listener in this.listeners.copy()) {
			Reflect.callMethod(null, listener, args);
		}
	}

	public inline function clear() {
		this.listeners.resize(0);
	}
}
