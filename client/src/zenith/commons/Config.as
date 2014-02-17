package zenith.commons
{
	import robotlegs.bender.extensions.contextView.ContextView;
	import robotlegs.bender.extensions.eventCommandMap.api.IEventCommandMap;
	import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;
	import robotlegs.bender.extensions.signalCommandMap.api.ISignalCommandMap;
	import robotlegs.bender.framework.api.IConfig;
	import robotlegs.bender.framework.api.IInjector;
	
	import starling.core.Starling;
	
	public class Config implements IConfig
	{
		[Inject]
		public var injector:IInjector;
		
		[Inject]
		public var mediatorMap:IMediatorMap;
		
		[Inject]
		public var commandMap:IEventCommandMap;
		
		[Inject]
		public var contextView:ContextView;
		
		[Inject]
		public var signalCommandMap:ISignalCommandMap;
		
		[Inject]
		public var starling:Starling;
		
		public function configure():void
		{
		}
	}
}