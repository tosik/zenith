package zenith.context.game.views
{
	import starling.display.Button;
	import starling.display.Sprite;
	import starling.text.TextField;
	import starling.textures.Texture;
	
	public class GameOverView extends Sprite
	{
		private var _retryingButton:Button;
		public function GameOverView()
		{
			var gameOverText:TextField = new TextField(700, 100, "Game Over", "Verdana", 50, 0x000000, true);
			gameOverText.x = 0;
			gameOverText.y = 300;
			addChild(gameOverText);

			_retryingButton = new Button(Texture.empty(200, 80), "Retry");
			addChild(_retryingButton);
		}

		public function get retryingButton():Button
		{
			return _retryingButton;
		}

	}
}