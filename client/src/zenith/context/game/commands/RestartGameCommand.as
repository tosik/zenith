package zenith.context.game.commands
{
	import robotlegs.bender.bundles.mvcs.Command;
	
	import zenith.commons.SceneRoot;
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

		override public function execute():void
		{
			sceneRoot.changeView(new GameView);
			resetGame();
		}
		
		private function resetGame():void
		{
			score.reset();
			plane.reset();
			collisionDetecotr.removeAll();
		}
	}
}