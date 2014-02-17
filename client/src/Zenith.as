package
{
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	
	import robotlegs.bender.bundles.mvcs.MVCSBundle;
	import robotlegs.bender.extensions.contextView.ContextView;
	import robotlegs.bender.extensions.signalCommandMap.SignalCommandMapExtension;
	import robotlegs.bender.framework.api.IContext;
	import robotlegs.bender.framework.impl.Context;
	import robotlegs.extensions.starlingViewMap.StarlingViewMapExtension;
	
	import starling.core.Starling;
	import starling.events.Event;
	
	import zenith.context.game.GameConfig;
	import zenith.context.title.TitleConfig;
	
	public class Zenith extends Sprite
	{
		private var _context:IContext;
		private var _starling:Starling;

		public function Zenith()
		{
			super();
			
			// autoOrients をサポート
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;

			_starling = new Starling(StarlingRootSprite, stage);
			_starling.start();
			
			var root:Sprite = this;
			_starling.addEventListener(starling.events.Event.ROOT_CREATED, function():void
			{
				_context = new Context()
					.install(MVCSBundle)
					.install(SignalCommandMapExtension)
					.install(StarlingViewMapExtension)
					.configure(_starling, TitleConfig, GameConfig)
					.configure(new ContextView(root));
				_context.initialize();
			});
		}
	}
}