package zenith.context.game.models
{
	import flash.geom.Rectangle;
	
	import robotlegs.bender.extensions.starling.impl.StarlingEventMap;
	
	import starling.display.DisplayObject;
	import starling.events.Event;
	import starling.events.EventDispatcher;

	public class CheckpointDetector
	{
		protected var eventMap:StarlingEventMap = new StarlingEventMap;
		protected var list:Vector.<DisplayObject> = new Vector.<DisplayObject>;
		
		public function add(view:DisplayObject):void
		{
			list.push(view);
			eventMap.mapStarlingEvent(view, Event.REMOVED_FROM_STAGE, removed);
		}
		
		protected function removed(e:Event):void
		{
			list.splice(list.indexOf(e.target as DisplayObject), 1);
			eventMap.unmapStarlingEvent(e.target as EventDispatcher, Event.REMOVED_FROM_STAGE, removed);
		}
		
		public function hitTest(bounds:Rectangle):Boolean
		{
			for each (var view:DisplayObject in list)
			{
				if (view.getBounds(view.stage).intersects(bounds))
					return true;
			}
			
			return false;
		}
		
		public function removeHitView(bounds:Rectangle):void
		{
			for each (var view:DisplayObject in list)
			{
				if (view.getBounds(view.stage).intersects(bounds))
					view.parent.removeChild(view);
			}
		}
		
		public function removeAll():void
		{
			for each (var view:DisplayObject in list)
			{
				if (view.parent != null)
					view.removeFromParent();
			}
			list = new Vector.<DisplayObject>();
			eventMap.unmapListeners();
		}
	}
}