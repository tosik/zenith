package robotlegs.bender.extensions.starling.impl
{
	import robotlegs.bender.extensions.localEventMap.impl.EventMap;
	import robotlegs.bender.extensions.starling.api.IStarlingEventMap;
	
	import starling.events.EventDispatcher;
	
	public class StarlingEventMap extends EventMap implements IStarlingEventMap
	{
		private var starlingListeners:Vector.<Object> = new Vector.<Object>;

		public function mapStarlingEvent(eventDispatcher:EventDispatcher, type:String, listener:Function):void
		{
			eventDispatcher.addEventListener(type, listener);
			starlingListeners.push({ eventDispatcher: eventDispatcher, type: type, listener: listener });
		}

		public function unmapStarlingEvent(eventDispatcher:EventDispatcher, type:String, listener:Function):void
		{
			eventDispatcher.removeEventListener(type, listener);
			var erases:Vector.<int> = new Vector.<int>;
			for (var index:int = 0 ; index < starlingListeners.length ; index ++)
			{
				var info:Object = starlingListeners[index];
				if (info.eventDispatcher == eventDispatcher && info.type == type && info.listener == listener)
					erases.push(index);
			}
			for each (var i:int in erases)
			{
				starlingListeners.splice(i, 1);
			}
		}
		
		override public function unmapListeners():void
		{
			super.unmapListeners();
			unmapStarlingListeners();
		}
		
		private function unmapStarlingListeners():void
		{
			for each (var info:Object in starlingListeners.concat())
			{
				unmapStarlingEvent(info.eventDispatcher, info.type, info.listener);
			}
		}
	}
}