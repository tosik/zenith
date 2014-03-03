package zenith.context.game.views
{
	import robotlegs.bender.extensions.starling.impl.StarlingMediator;
	
	import zenith.context.game.models.Score;
	
	public class ScoreViewMediator extends StarlingMediator
	{
		[Inject]
		public var view:ScoreView;
		
		[Inject]
		public var score:Score;

		override public function initialize():void
		{
			view.layoutSubviews();
			signalMap.mapListener(score.changed, scoreChanged);
			scoreChanged();
		}
		
		private function scoreChanged():void
		{
			view.setScore(score.value);
		}
	}
}