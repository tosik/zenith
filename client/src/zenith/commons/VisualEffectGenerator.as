package zenith.commons
{
	import caurina.transitions.Tweener;
	
	import starling.core.Starling;
	import starling.display.Quad;
	import starling.display.Stage;

	public class VisualEffectGenerator
	{
		[Inject]
		public var starling:Starling;

		public function flash():void
		{
			var stage:Stage = starling.stage;
			var view:Quad = new Quad(stage.width, stage.height, 0xffffffff);
			stage.addChild(view);
			
			Tweener.addTween(view, {
				alpha: 0,
				time: 0.1,
				transition:'easeInOutBounce'
			});
		}
	}
}