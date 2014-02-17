package zenith.context.title
{
	import zenith.commons.Config;
	import zenith.commons.SceneRoot;
	import zenith.commons.commands.StartGameSceneCommand;
	import zenith.commons.signals.GameStartRequested;
	import zenith.context.title.views.TitleView;
	import zenith.context.title.views.TitleViewMediator;
	
	public class TitleConfig extends Config
	{
		[Inject]
		public var sceneRoot:SceneRoot;
		
		override public function configure():void
		{
			// signals
			injector.map(GameStartRequested).asSingleton();
			
			// mediators
			mediatorMap.map(TitleView).toMediator(TitleViewMediator);
			
			// commands
			signalCommandMap.map(GameStartRequested).toCommand(StartGameSceneCommand);

			// initialize views
			sceneRoot.changeView(new TitleView);
		}
	}
}