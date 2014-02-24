package zenith.context.game.models
{
	import starling.display.DisplayObject;
	
	import zenith.context.game.views.ObstacleView;

	public class ObstacleCollisionDetector extends CheckpointDetector
	{
		override public function add(view:DisplayObject):void
		{
			if (view is ObstacleView)
			{
				for each (var child:DisplayObject in (view as ObstacleView).realObstacles)
				add(child);
			}
			else
			{
				super.add(view);
			}
		}
	}
}