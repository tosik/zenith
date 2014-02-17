package robotlegs.bender.extensions.starling
{
	import robotlegs.bender.extensions.matching.instanceOfType;
	import robotlegs.bender.extensions.starling.impl.StarlingViewMap;
	import robotlegs.bender.framework.api.IContext;
	import robotlegs.bender.framework.api.IExtension;
	import robotlegs.bender.framework.impl.UID;
	
	import starling.core.Starling;

	public class StarlingExtension implements IExtension
	{
		private var _uid:String = UID.create( StarlingExtension );
		private var _context:IContext;

		public function extend(context:IContext):void
		{
			_context = context;
			_context.addConfigHandler(instanceOfType(Starling), handleStarling);

			_context.injector.map(StarlingViewMap).asSingleton();
		}
		
		private function handleStarling( starling:Starling ):void
		{
			_context.injector.map(Starling).toValue(starling);
			_context.injector.getInstance(StarlingViewMap);
		}		
	}
}