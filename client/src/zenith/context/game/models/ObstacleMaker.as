package zenith.context.game.models
{
	public class ObstacleMaker
	{
		public function ObstacleMaker()
		{
		}
		
		public function make():Obstacle
		{
			return new Obstacle(Math.random() * 10);
		}
		
		public function nextExists():Boolean
		{
			return Math.random() < 0.01;
		}
	}
}