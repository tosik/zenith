package zenith.context.game.views
{
	import robotlegs.bender.extensions.starling.impl.StarlingMediator;
	
	import zenith.context.game.models.ObstacleCollisionDetector;
	
	public class GroundViewMediator extends StarlingMediator
	{
		[Inject]
		public var view:GroundView;
		
		[Inject]
		public var collisionDetector:ObstacleCollisionDetector;
		
		override public function initialize():void
		{
			collisionDetector.add(view);
			view.layoutSubviews();
		}
	}
}