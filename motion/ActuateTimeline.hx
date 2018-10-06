package motion;
import haxe.Constraints.Function;
import haxe.Timer;
import haxe.ds.Vector;

import motion.Actuate;
import motion.actuators.GenericActuator;

class ActuateTimeline
{

	var tweens : Array<GenericActuator<Dynamic>> = new Array<GenericActuator<Dynamic>>();
	var tlStart : Float = 0;
	var tlEnd : Float = 0;

	public function new()
	{
		tlStart = Timer.stamp();
		tlEnd = tlStart;
	}

	public function tween<T>(target:T, duration:Float, properties:Dynamic, overwrite:Bool = true, customActuator:Class<GenericActuator<T>> = null):GenericActuator<T>
	{
		var currTime = Timer.stamp();
		tlEnd = Math.max(tlEnd, currTime);
		var newTween : GenericActuator<T> = Actuate.tween(target, duration, properties, false);
		newTween.delay(tlEnd - currTime);
		tlEnd += duration;
		return newTween;
	}

	public function addCallback(callback:Function, ?params:Array<Dynamic>)
	{
		var time_ms : Int = Std.int((tlEnd - Timer.stamp()) * 1000);
		if (params == null){
			Timer.delay(cast callback, time_ms);
		} else {
			var t = new haxe.Timer(time_ms);
			t.run = function() {
				t.stop();
				Reflect.callMethod(null, callback, params);
			};
		}
	}
	
	
}