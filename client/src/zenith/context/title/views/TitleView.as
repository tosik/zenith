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
		
		[Embed(source="assets/start_button.png")]
		private static const ButtonImage:Class;
		
		public var startButton:Button;
		private var background:Image;

		public function TitleView()
		{
			background = Image.fromBitmap(new TitleImage);
			addChild(background);

			var texture:Texture = Texture.fromEmbeddedAsset(ButtonImage);
			startButton = new Button(texture, '');
			addChild(startButton);
		}
		
		public function layoutSubviews():void
		{
			var scale:Number = stage.stageWidth / background.width;
			background.scaleX = scale;
			background.scaleY = scale;

			startButton.y = 380;
			startButton.x = stage.stageWidth / 2 - startButton.width / 2;
		}
	}
}