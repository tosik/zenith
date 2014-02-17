package robotlegs.bender.extensions.starling.impl
{
	import robotlegs.bender.extensions.mediatorMap.api.IMediator;
	import robotlegs.bender.extensions.starling.api.IStarlingEventMap;
	import robotlegs.bender.signalMap.api.ISignalMap;
	import robotlegs.bender.signalMap.impl.SignalMap;
	
	public class StarlingMediator implements IMediator
	{
		protected const eventMap:IStarlingEventMap = new StarlingEventMap;
		protected const signalMap:ISignalMap = new SignalMap;
		
		public function initialize():void
		{
		}
		
		public function destroy():void
		{
			eventMap.unmapListeners();
			signalMap.unmapListeners();
		}
	}
}