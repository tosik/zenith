package zenith.commons.commands
{
	import robotlegs.bender.bundles.mvcs.Command;
	
	import zenith.commons.SceneRoot;
	import zenith.context.game.views.GameView;
	
	public class StartGameSceneCommand extends Command
	{
		[Inject]
		public var sceneRoot:SceneRoot;

		override public function execute():void
		{
			sceneRoot.changeView(new GameView);
		}
	}
}