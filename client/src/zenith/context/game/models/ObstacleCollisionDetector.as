package zenith.context.game.models
{
	import flash.geom.Rectangle;
	
	import robotlegs.bender.extensions.starling.impl.StarlingEventMap;
	
	import starling.display.DisplayObject;
	import starling.events.Event;
	
	import zenith.context.game.views.ObstacleView;

	public class ObstacleCollisionDetector
	{
		private var eventMap:StarlingEventMap = new StarlingEventMap;
		private var list:Vector.<DisplayObject> = new Vector.<DisplayObject>;

		public function add(view:DisplayObject):void
		{
			if (view is ObstacleView)
			{
				for each (var child:DisplayObject in (view as ObstacleView).realObstacles)
					add(child);
			}
			else
			{
				list.push(view);
				eventMap.mapStarlingEvent(view, Event.REMOVED_FROM_STAGE, removed);
			}
		}
		
		private function removed(e:Event):void
		{
			list.splice(list.indexOf(e.target as DisplayObject), 1);
		}

		public function hitTest(bounds:Rectangle):Boolean
		{
			for each (var view:DisplayObject in list)
			{
				if (view.bounds.intersects(bounds))
					return true;
			}
			
			return false;
		}
	}
}