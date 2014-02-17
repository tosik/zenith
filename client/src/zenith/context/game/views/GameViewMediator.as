package zenith.context.game.views
{
	import robotlegs.bender.extensions.starling.impl.StarlingMediator;
	
	import zenith.context.game.signals.GameViewAppended;
	
	public class GameViewMediator extends StarlingMediator
	{
		[Inject]
		public var gameViewAppended:GameViewAppended;

		override public function initialize():void
		{
			gameViewAppended.dispatch();
		}
	}
}