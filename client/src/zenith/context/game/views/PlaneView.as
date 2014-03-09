package zenith.context.game.views
{
	import flash.geom.Rectangle;
	
	import caurina.transitions.Tweener;
	
	import starling.display.Image;
	import starling.display.Sprite;
	
	public class PlaneView extends Sprite
	{
		[Embed(source="assets/plane.png")]
		private static const PlaneImage:Class;
		
		private var plane:Image;
		public function PlaneView()
		{
			plane = Image.fromBitmap(new PlaneImage);
			//plane.width *= 4;
			//plane.height *= 4;
			addChild(plane);
		}
		
		public function get collision():Rectangle
		{
			var size:Number = 40;
			return new Rectangle(this.x + width / 2 - size, this.y + height / 2 - size, size, size);
		}
		
		public function startDyingAction():void
		{
			Tweener.addTween(this, {
				y: this.y + 1000,
				time: 1,
				transition:'easeInBack'
			});
		}
		
		public function cancelAction():void
		{
			Tweener.removeTweens(this);
		}
	}
}