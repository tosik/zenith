package zenith.context.game.views
{
	import starling.display.Sprite;
	import starling.text.BitmapFont;
	import starling.text.TextField;
	import starling.textures.Texture;
	import starling.utils.Color;
	
	public class ScoreView extends Sprite
	{
		private var scoreTextField:TextField;
		
		[Embed(source = "assets/fonts/font.png")]
		private static const ScoreFontImage:Class;
		[Embed(source = "assets/fonts/font.fnt", mimeType="application/octet-stream")]
		private static const ScoreFont:Class;

		public function ScoreView()
		{
			var bitmapFont:BitmapFont = new BitmapFont(Texture.fromEmbeddedAsset(ScoreFontImage), XML(new ScoreFont));
			TextField.registerBitmapFont(bitmapFont);

			scoreTextField = new TextField(300, 300, "0");
			scoreTextField.fontName = bitmapFont.name;
			scoreTextField.fontSize = BitmapFont.NATIVE_SIZE * 2;
			scoreTextField.color = Color.WHITE;
			addChild(scoreTextField);
		}
		
		public function setScore(value:Number):void
		{
			scoreTextField.text = value.toString();
		}
		
		public function layoutSubviews():void
		{
			scoreTextField.x = stage.width / 2 - 330;
			scoreTextField.y = 100;
		}
	}
}