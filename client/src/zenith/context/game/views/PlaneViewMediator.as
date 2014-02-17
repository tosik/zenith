package zenith.context.game.views
{
	import robotlegs.bender.extensions.starling.impl.StarlingMediator;
	
	import zenith.context.game.models.Plane;
	
	public class PlaneViewMediator extends StarlingMediator
	{
		[Inject]
		public var plane:Plane;
		
		[Inject]
		public var view:PlaneView;
		
		override public function initialize():void
		{
			signalMap.mapListener(plane.changed, planeChanged);
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
	}
}