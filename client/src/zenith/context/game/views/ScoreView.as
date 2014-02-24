package zenith.context.game.views
{
	import starling.display.Sprite;
	import starling.text.TextField;
	
	public class ScoreView extends Sprite
	{
		private var scoreTextField:TextField;

		public function ScoreView()
		{
			scoreTextField = new TextField(50, 50, "", "Verdana", 30);
			addChild(scoreTextField);
		}
		
		public function setScore(value:Number):void
		{
			scoreTextField.text = value.toString();
		}
	}
}