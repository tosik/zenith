package zenith.context.game.views
{
	import flash.geom.Point;
	
	import robotlegs.bender.extensions.starling.impl.StarlingMediator;
	
	import zenith.commons.signals.HeartbeatSignal;
	import zenith.context.game.models.ObstacleCollisionDetector;
	import zenith.context.game.models.Plane;
	import zenith.context.game.signals.Collided;
	
	public class PlaneViewMediator extends StarlingMediator
	{
		[Inject]
		public var plane:Plane;
		
		[Inject]
		public var view:PlaneView;
		
		[Inject]
		public var heartbeat:HeartbeatSignal;
		
		[Inject]
		public var collided:Collided;
		
		[Inject]
		public var collisionDetector:ObstacleCollisionDetector;
		
		override public function initialize():void
		{
			signalMap.mapListener(plane.changed, planeChanged);
			signalMap.mapListener(heartbeat, onHeartbeat);
		}
		
		private function planeChanged():void
		{
			view.x = 200;
			view.y = plane.height;
			
			var direction:Number = plane.velocity;
			if (direction > 1) direction = 1;
			if (direction < -1) direction = -1;
			view.rotation = Math.PI * direction / 5;
		}

		private function onHeartbeat():void
		{
			detectCollision();
		}
		
		private function detectCollision():void
		{
			if (collisionDetector.hitTest(view.bounds))
			{
				collided.dispatch();
			}
		}
	}
}