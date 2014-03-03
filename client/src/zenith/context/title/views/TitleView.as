package zenith.context.title.views
{
	import starling.display.Button;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.textures.Texture;

	public class TitleView extends Sprite
	{
		[Embed(source="assets/title.png")]
		private static const TitleImage:Class;
		
		[Embed(source="assets/button.png")]
		private static const ButtonImage:Class;
		
		public var startButton:Button;

		public function TitleView()
		{
			var background:Image = Image.fromBitmap(new TitleImage);
			background.scaleX = 0.54;
			background.scaleY = 0.5;
			addChild(background);

			var texture:Texture = Texture.fromEmbeddedAsset(ButtonImage);
			startButton = new Button(texture, '▶　おすと　はじまる');
			startButton.fontSize = 20;
			addChild(startButton);
		}
		
		public function layoutSubviews():void
		{
			startButton.y = 650;
			startButton.x = stage.stageWidth / 2;
		}
	}
}