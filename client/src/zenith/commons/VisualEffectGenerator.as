package zenith.commons
{
	import caurina.transitions.Tweener;
	
	import starling.core.Starling;
	import starling.display.DisplayObject;
	import starling.display.Quad;
	import starling.display.Stage;

	public class VisualEffectGenerator
	{
		[Inject]
		public var starling:Starling;
		private const VIEW_NAME:String = "visualEffect";

		public function flash():void
		{
			var stage:Stage = starling.stage;
			var view:Quad = new Quad(stage.width, stage.height, 0xffffffff);
			view.name = VIEW_NAME;
			stage.addChild(view);
			
			Tweener.addTween(view, {
				alpha: 0,
				time: 0.1,
				transition:'easeInOutBounce',
				onComplete: finish
			});
		}
		
		private function finish():void
		{
			var stage:Stage = starling.stage;
			var view:DisplayObject = stage.getChildByName(VIEW_NAME);
			view.removeFromParent();
		}
	}
}