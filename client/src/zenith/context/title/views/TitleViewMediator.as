package zenith.context.title.views
{
	import robotlegs.extensions.starlingViewMap.impl.StarlingMediator;
	
	import starling.events.Event;
	
	import zenith.events.GameStartRequested;
	
	public class TitleViewMediator extends StarlingMediator
	{
		[Inject]
		public var view:TitleView;
		
		[Inject]
		public var gameStartRequested:GameStartRequested;
		
		override public function initialize():void
		{
			eventMap.mapStarlingListener(view.startButton, Event.TRIGGERED,
				function(e:Event):void { gameStartRequested.dispatch(); });
		}
	}
}