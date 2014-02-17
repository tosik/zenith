package robotlegs.bender.extensions.starling.impl
{
	import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;
	import robotlegs.bender.extensions.starling.api.IStarlingEventMap;
	
	import starling.core.Starling;
	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;
	import starling.events.Event;

	public class StarlingViewMap
	{
		[Inject]
		public var starling:Starling;
		
		[Inject]
		public var mediatorMap:IMediatorMap;

		private var eventMap:IStarlingEventMap = new StarlingEventMap;

		[PostConstruct]
		public function initialize():void
		{
			eventMap.mapStarlingEvent(starling, Event.ROOT_CREATED, starlingRootCreated);
			eventMap.mapStarlingEvent(starling.stage, Event.ADDED, addedToStarlingStage);
			eventMap.mapStarlingEvent(starling.stage, Event.REMOVED, removedFromStarlingStage);
		}
		
		private function starlingRootCreated(event:Event):void
		{
			addView(starling.stage);
		}
		
		private function addedToStarlingStage(event:Event):void
		{
			addView(event.target as DisplayObject);
		}
		
		private function removedFromStarlingStage(event:Event):void
		{
			removeView(event.target as DisplayObject);
		}
		
		private function addView(view:DisplayObject):void
		{
			mediatorMap.mediate(view);
			var container:DisplayObjectContainer = view as DisplayObjectContainer;
			if (container)
			{
				for (var i:Number = 0 ; i < container.numChildren ; i ++)
					addView(container.getChildAt(i));
			}
		}
		
		private function removeView(view:DisplayObject):void
		{
			mediatorMap.unmediate(view);
			var container:DisplayObjectContainer = view as DisplayObjectContainer;
			if (container)
			{
				for (var i:Number = 0 ; i < container.numChildren ; i ++)
					removeView(container.getChildAt(i));
			}
		}
		
		public function destroy():void
		{
			eventMap.unmapListeners();
		}
	}
}