package zenith.context.game.models
{
	import robotlegs.bender.extensions.starling.impl.StarlingEventMap;
	
	import starling.core.Starling;
	import starling.events.Event;
	
	import zenith.commons.signals.HeartbeatSignal;

	public class HeartbeatMachine
	{
		[Inject]
		public var heartbeat:HeartbeatSignal;

		[Inject]
		public var starling:Starling;
		
		private var eventMap:StarlingEventMap = new StarlingEventMap();
		
		public function start():void
		{
			eventMap.mapStarlingEvent(starling.stage, Event.ENTER_FRAME, onEnterFrame);
		}
		
		public function stop():void
		{
			eventMap.unmapListeners();
		}
		
		private function onEnterFrame(e:Event):void
		{
			heartbeat.dispatch();
		}
	}
}