package zenith.context.game.views
{
	import starling.display.Sprite;
	
	public class GameView extends Sprite
	{
		public function GameView()
		{
			var obstacles:Sprite = new Sprite();
			obstacles.name = "obstacles";

			addChild(new BackgroundView);
			addChild(obstacles);
			addChild(new GroundView);
			addChild(new PlaneView);
			addChild(new ScoreView);
		}
	}
}