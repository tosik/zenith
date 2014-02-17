package zenith.context.game.models
{
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import robotlegs.bender.extensions.localEventMap.impl.EventMap;
	
	import zenith.commons.signals.HeartbeatSignal;

	public class HeartbeatMachine
	{
		[Inject]
		public var heartbeat:HeartbeatSignal;

		private var timer:Timer;
		private var eventMap:EventMap = new EventMap();

		public function start():void
		{
			timer = new Timer(10);
			eventMap.mapListener(timer, TimerEvent.TIMER, onTimer);
			timer.start();
		}
		
		private function onTimer(e:Event):void
		{
			heartbeat.dispatch();
		}
	}
}