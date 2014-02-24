package zenith.context.game.views
{
	import starling.display.Sprite;
	
	public class GameView extends Sprite
	{
		public function GameView()
		{
			addChild(new BackgroundView);
			addChild(new GroundView);
			addChild(new PlaneView);
			addChild(new ScoreView);
		}
	}
}