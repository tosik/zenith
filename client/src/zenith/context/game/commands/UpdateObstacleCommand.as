package zenith.context.game.commands
{
	import robotlegs.bender.bundles.mvcs.Command;
	
	import zenith.commons.SceneRoot;
	import zenith.context.game.models.Obstacle;
	import zenith.context.game.models.ObstacleMaker;
	import zenith.context.game.models.ObstacleViewFactory;
	import zenith.context.game.views.ObstacleView;
	
	public class UpdateObstacleCommand extends Command
	{
		[Inject]
		public var factory:ObstacleViewFactory;
		
		[Inject]
		public var maker:ObstacleMaker;
		
		[Inject]
		public var sceneRoot:SceneRoot;
		
		override public function execute():void
		{
			maker.countDown();
			if (maker.nextExists())
			{
				var obstacle:Obstacle = maker.make();
				var obstacleView:ObstacleView = factory.create(obstacle);
				sceneRoot.addChild(obstacleView);
			}
		}
	}
}