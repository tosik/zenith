package
{
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	
	import robotlegs.bender.bundles.mvcs.MVCSBundle;
	import robotlegs.bender.extensions.contextView.ContextView;
	import robotlegs.bender.extensions.signalCommandMap.SignalCommandMapExtension;
	import robotlegs.bender.extensions.starling.StarlingExtension;
	import robotlegs.bender.framework.api.IContext;
	import robotlegs.bender.framework.impl.Context;
	
	import starling.core.Starling;
	import starling.events.Event;
	
	import zenith.commons.ZenithConfig;
	import zenith.context.game.GameConfig;
	import zenith.context.title.TitleConfig;
	
	public class Zenith extends Sprite
	{
		private var _context:IContext;
		private var _starling:Starling;

		public function Zenith()
		{
			super();
			
			stage.frameRate = 60;
			
			// autoOrients をサポート
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;

			_starling = new Starling(StarlingRootSprite, stage, stage.fullScreenSourceRect);
			_starling.start();

			var root:Sprite = this;
			_starling.addEventListener(starling.events.Event.ROOT_CREATED, function():void
			{
				_context = new Context()
					.install(MVCSBundle)
					.install(SignalCommandMapExtension)
					.install(StarlingExtension)
					.configure(_starling, ZenithConfig, TitleConfig, GameConfig)
					.configure(new ContextView(root));
				_context.initialize();
			});
		}
	}
}