package zenith.context.game.views
{
	import robotlegs.bender.extensions.starling.impl.StarlingMediator;
	
	public class BackgroundViewMediator extends StarlingMediator
	{
		[Inject]
		public var view:BackgroundView;

		override public function initialize():void
		{
			view.layoutSubviews();
		}
	}
}