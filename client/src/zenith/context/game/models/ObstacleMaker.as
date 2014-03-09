package zenith.context.game.models
{
	public class ObstacleMaker
	{
		private var _count:int = 70;

		public function make():Obstacle
		{
			_count = 4 * 16 * 1.5;
			return new Obstacle(Math.floor(Math.random() * 10) + 5);
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