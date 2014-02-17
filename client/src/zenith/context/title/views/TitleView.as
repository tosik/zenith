package zenith.context.title.views
{
	import starling.display.Button;
	import starling.display.Sprite;
	import starling.textures.Texture;

	public class TitleView extends starling.display.Sprite
	{
		public var startButton:Button;

		public function TitleView()
		{
			var texture:Texture = Texture.empty(100, 50);
			startButton = new Button(texture, 'Press to start');
			addChild(startButton);
		}
	}
}