package zenith.context.title.views
{
	import robotlegs.bender.extensions.starling.impl.StarlingMediator;
	
	import starling.events.Event;
	
	import zenith.commons.signals.GameStartRequested;
	
	public class TitleViewMediator extends StarlingMediator
	{
		[Inject]
		public var view:TitleView;
		
		[Inject]
		public var gameStartRequested:GameStartRequested;
		
		override public function initialize():void
		{
			view.layoutSubviews();

			eventMap.mapStarlingEvent(view.startButton, Event.TRIGGERED,
				function(e:Event):void { gameStartRequested.dispatch(); });
		}
	}
}