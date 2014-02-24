package zenith.context.game.views
{
	import robotlegs.bender.extensions.starling.impl.StarlingMediator;
	
	import zenith.commons.signals.HeartbeatSignal;
	import zenith.context.game.models.CheckpointDetector;
	import zenith.context.game.models.ObstacleCollisionDetector;
	import zenith.context.game.models.Plane;
	import zenith.context.game.signals.CheckpointPassed;
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
		
		[Inject]
		public var checkpointPassed:CheckpointPassed;
		
		[Inject]
		public var checkpointDetector:CheckpointDetector;
		
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
			checkCheckpoint();
		}
		
		private function detectCollision():void
		{
			if (collisionDetector.hitTest(view.bounds))
			{
				collided.dispatch();
			}
		}
		
		private function checkCheckpoint():void
		{
			if (checkpointDetector.hitTest(view.bounds))
			{
				checkpointDetector.removeHitView(view.bounds);
				checkpointPassed.dispatch();
			}
		}
	}
}