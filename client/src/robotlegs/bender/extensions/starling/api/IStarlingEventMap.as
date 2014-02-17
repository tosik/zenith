package robotlegs.bender.extensions.starling.api
{
	import robotlegs.bender.extensions.localEventMap.api.IEventMap;
	
	import starling.events.EventDispatcher;
	
	public interface IStarlingEventMap extends IEventMap
	{
		function mapStarlingEvent(eventDispatcher:EventDispatcher, type:String, listener:Function):void;
		function unmapStarlingEvent(eventDispatcher:EventDispatcher, type:String, listener:Function):void;
	}
}