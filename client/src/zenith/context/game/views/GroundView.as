package zenith.context.game.views
{
	import starling.display.Image;
	import starling.display.Sprite;
	
	public class GroundView extends Sprite
	{
		[Embed(source="assets/ground.png")]
		private static const WallImage:Class;

		private var wall:Image;
		public function GroundView()
		{
			wall = Image.fromBitmap(new WallImage);
			addChild(wall);
			wall.y = 600;
			wall.width *= 6;
			wall.height *= 6;
		}
	}
}