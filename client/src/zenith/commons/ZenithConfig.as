package zenith.commons
{
	

	public class ZenithConfig extends Config
	{
		override public function configure():void
		{
			injector.map(SceneRoot).asSingleton();
			starling.stage.addChild(injector.getInstance(SceneRoot));
		}
	}
}