package zenith.context.title
{
	import zenith.commons.Config;
	import zenith.context.title.views.TitleView;
	import zenith.context.title.views.TitleViewMediator;
	import zenith.events.GameStartRequested;
	
	public class TitleConfig extends Config
	{
		override public function configure():void
		{
			// signals
			injector.map(GameStartRequested).asSingleton();
			
			mediatorMap.map(TitleView).toMediator(TitleViewMediator);
			starling.stage.addChild(new TitleView);
		}
	}
}