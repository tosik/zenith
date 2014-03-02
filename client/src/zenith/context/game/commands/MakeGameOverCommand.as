package zenith.context.game.commands
{
	import robotlegs.bender.bundles.mvcs.Command;
	
	import zenith.commons.SceneRoot;
	import zenith.commons.VisualEffectGenerator;
	import zenith.context.game.models.HeartbeatMachine;
	import zenith.context.game.models.Plane;
	import zenith.context.game.views.GameOverView;
	
	public class MakeGameOverCommand extends Command
	{
		[Inject]
		public var heartbeatMachine:HeartbeatMachine;

		[Inject]
		public var plane:Plane;
		
		[Inject]
		public var visualEffect:VisualEffectGenerator;
		
		[Inject]
		public var sceneRoot:SceneRoot;
		
		override public function execute():void
		{
			heartbeatMachine.stop();
			plane.die();
			visualEffect.flash();
			showGameOverView();
		}
		
		private function showGameOverView():void
		{
			var gameOverView:GameOverView = new GameOverView();
			sceneRoot.addChild(gameOverView);
		}
	}
}