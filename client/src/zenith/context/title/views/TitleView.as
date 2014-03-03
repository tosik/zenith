package zenith.context.title.views
{
	import starling.display.Button;
	import starling.display.Sprite;
	import starling.text.TextField;
	import starling.textures.Texture;

	public class TitleView extends Sprite
	{
		public var startButton:Button;
		private var titleText:TextField;

		public function TitleView()
		{
			titleText = new TextField(400, 100, "ひろっぴーバード", "Verdana", 32, 0x000000, true);
			addChild(titleText);

			var texture:Texture = Texture.empty(300, 50);
			startButton = new Button(texture, 'Press to start');
			startButton.fontSize = 20;
			addChild(startButton);
		}
		
		public function layoutSubviews():void
		{
			titleText.y = 150;
			titleText.x = stage.stageWidth / 2 - titleText.width / 2;

			startButton.y = 350;
			startButton.x = stage.stageWidth / 2 - startButton.width / 2;
		}
	}
}