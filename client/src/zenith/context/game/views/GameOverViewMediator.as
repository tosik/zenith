package zenith.context.game.views
{
	import robotlegs.bender.extensions.starling.impl.StarlingMediator;
	
	import starling.events.Event;
	
	import zenith.context.game.signals.RestartRequested;
	
	public class GameOverViewMediator extends StarlingMediator
	{
		[Inject]
		public var view:GameOverView;
		
		[Inject]
		public var restartRequested:RestartRequested;
		
		override public function initialize():void
		{
			eventMap.mapStarlingEvent(view.retryingButton, Event.TRIGGERED, retryingButtonTriggered);
		}
		
		private function retryingButtonTriggered(e:Event):void
		{
			restartRequested.dispatch();
		}
	}
}