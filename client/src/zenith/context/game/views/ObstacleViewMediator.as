package zenith.context.game.views
{
	import robotlegs.bender.extensions.starling.impl.StarlingMediator;
	
	import starling.events.Event;
	
	public class ObstacleViewMediator extends StarlingMediator
	{
		[Inject]
		public var view:ObstacleView;

		override public function initialize():void
		{
			view.x = 500;

			eventMap.mapStarlingEvent(view, Event.ENTER_FRAME, onEnterFrame);
		}
		
		private function onEnterFrame(e:Event):void
		{
			view.x -= 5;
			
			if (view.x + view.width < 0)
				view.removeFromParent();
		}
	}
}