package zenith.context.game.commands
{
	import robotlegs.bender.bundles.mvcs.Command;
	
	import zenith.commons.SceneRoot;
	import zenith.context.game.models.CheckpointDetector;
	import zenith.context.game.models.ObstacleCollisionDetector;
	import zenith.context.game.models.Plane;
	import zenith.context.game.models.Score;
	import zenith.context.game.views.GameView;
	
	public class RestartGameCommand extends Command
	{
		[Inject]
		public var sceneRoot:SceneRoot;
		
		[Inject]
		public var score:Score;
		
		[Inject]
		public var plane:Plane;
		
		[Inject]
		public var collisionDetecotr:ObstacleCollisionDetector;
		
		[Inject]
		public var checkpointDetector:CheckpointDetector;

		override public function execute():void
		{
			resetGame();
			sceneRoot.changeView(new GameView);
		}
		
		private function resetGame():void
		{
			collisionDetecotr.removeAll();
			checkpointDetector.removeAll();
			score.reset();
			plane.reset();
		}
	}
}