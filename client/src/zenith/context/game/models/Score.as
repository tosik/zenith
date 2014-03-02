package zenith.context.game.models
{
	import org.osflash.signals.ISignal;
	import org.osflash.signals.Signal;

	public class Score
	{
		public var changed:ISignal = new Signal;

		private var _value:Number = 0;

		public function get value():Number
		{
			return _value;
		}

		public function set value(value:Number):void
		{
			_value = value;
			changed.dispatch();
		}

		public function reset():void
		{
			_value = 0;
		}
	}
}