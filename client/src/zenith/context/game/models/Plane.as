package zenith.context.game.models
{
	import org.osflash.signals.Signal;

	public class Plane
	{
		[Inject]
		public var field:Field;

		public var changed:Signal = new Signal;
		public var died:Signal = new Signal;

		private var _height:Number;
		private var _velocity:Number;
		private var acceleration:Number;
		private var _isDied:Boolean;

		public function Plane()
		{
			reset();

			changed.dispatch();
		}

		public function get velocity():Number
		{
			return _velocity;
		}

		public function set velocity(value:Number):void
		{
			_velocity = value;
		}

		public function get height():Number
		{
			return _height;
		}

		public function set height(value:Number):void
		{
			_height = value;

			changed.dispatch();
		}

		public function get isDied():Boolean
		{
			return _isDied;
		}
		
		public function flap():void
		{
			velocity = 0;
			acceleration = -10.5;

			changed.dispatch();
		}
		
		public function fall():void
		{
			velocity += acceleration;
			height += velocity;
			
			acceleration = 0.4;
			
			changed.dispatch();
		}
		
		public function collided():Boolean
		{
			if (height < field.rectangle.top)
				return true;
			if (height > field.rectangle.bottom)
				return true;
			
			return false;
		}
		
		public function die():void
		{
			died.dispatch();
			_isDied = true;
		}
		
		public function reset():void
		{
			_height = 200;
			velocity = 0;
			acceleration = 0;
			_isDied = false;
		}
	}
}