# haxe.Signal

A very simple signal system for Haxe.

## Usage

```haxe
final signal1 = new Signal<(Int)->Void>();
signal1 += (x:Int) -> {
    trace("signal has been called with parameter {x}");
};
signal1(1);

final signal2 = new Signal<(String, Array<Int>)->Void>();
signal2 += (x: String, y: Array<Int>) -> {
    trace("signal has been called with parameter {x} and {y}");
};
signal2("Hello, World!", [5, 8, 3]);

final signal3 = new Signal<(String, Array<Int>, String)->Void>();
final func3 = (x:String, y:Array<Int>, z:String) -> {
    trace("signal has been called with parameter {x} and {y} and {z}");
};
signal3 += func3;
signal3("Hello, World!", [5, 8, 3], "Hello, world again!");
signal3 -= func3;

final signal4 = new Signal<(Int)->Void>();
signal4.add((x:Int) -> {
    trace("signal has been called with parameter {x}");
});
signal4.dispatch(9);
```
