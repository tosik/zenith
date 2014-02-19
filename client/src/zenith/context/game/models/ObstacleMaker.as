package zenith.context.game.models
{
	public class ObstacleMaker
	{
		private var _count:int = 0;

		public function make():Obstacle
		{
			_count = 100;
			return new Obstacle(Math.random() * 10);
		}
		
		public function nextExists():Boolean
		{
			return _count <= 0;
		}
		
		public function countDown():void
		{
			_count --;
		}
	}
}