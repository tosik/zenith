package zenith.context.game.views
{
	import starling.display.Button;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.textures.Texture;
	import starling.textures.TextureSmoothing;
	
	public class GameOverView extends Sprite
	{
		[Embed(source="assets/restart_button.png")]
		private static const RestartButtonImage:Class;
		
		[Embed(source="assets/gameover.png")]
		private static const GameOverImage:Class;
		
		private var _retryingButton:Button;
		private var gameOverText:Image;

		public function GameOverView()
		{
			gameOverText = new Image(Texture.fromEmbeddedAsset(GameOverImage));
			gameOverText.smoothing = TextureSmoothing.TRILINEAR;
			addChild(gameOverText);

			_retryingButton = new Button(Texture.fromEmbeddedAsset(RestartButtonImage), "");
			_retryingButton.width /= 2;
			_retryingButton.height /= 2;
			addChild(_retryingButton);
		}

		public function get retryingButton():Button
		{
			return _retryingButton;
		}

		public function layoutSubviews():void
		{
			gameOverText.x = stage.stageWidth / 2 - gameOverText.width / 2;
			gameOverText.y = 350;

			_retryingButton.x = stage.stageWidth / 2 - _retryingButton.width / 2;
			_retryingButton.y = 450;
		}
	}
}