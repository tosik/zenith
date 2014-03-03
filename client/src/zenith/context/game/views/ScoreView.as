package zenith.context.game.views
{
	import starling.display.Sprite;
	import starling.text.TextField;
	
	public class ScoreView extends Sprite
	{
		private var scoreTextField:TextField;

		public function ScoreView()
		{
			scoreTextField = new TextField(60, 120, "", "Verdana", 90);
			addChild(scoreTextField);
		}
		
		public function setScore(value:Number):void
		{
			scoreTextField.text = value.toString();
		}
		
		public function layoutSubviews():void
		{
			scoreTextField.x = stage.width / 2 - 200;
			scoreTextField.y = 100;
		}
	}
}