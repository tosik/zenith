package zenith.context.game.views
{
	import robotlegs.bender.extensions.starling.impl.StarlingMediator;
	
	import zenith.commons.signals.HeartbeatSignal;
	
	public class ObstacleViewMediator extends StarlingMediator
	{
		[Inject]
		public var view:ObstacleView;

		[Inject]
		public var heartbeat:HeartbeatSignal;
		
		override public function initialize():void
		{
			view.x = 1000;
			signalMap.mapListener(heartbeat, onHeartbeat);
		}
		
		private function onHeartbeat():void
		{
			view.x -= 4;
			
			if (view.x + view.width < 0)
				view.removeFromParent();
		}
	}
}