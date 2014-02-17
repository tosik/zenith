package zenith.context.game.views
{
	import starling.display.Image;
	import starling.display.Sprite;
	
	public class PlaneView extends Sprite
	{
		[Embed(source="assets/plane.jpg")]
		private static const PlaneImage:Class;
		
		private var plane:Image;
		public function PlaneView()
		{
			plane = Image.fromBitmap(new PlaneImage);
			addChild(plane);
		}
	}
}