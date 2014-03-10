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
		}
		
		public function layoutSubviews():void
		{
			wall.y = 905;
			var scale:Number = stage.stageWidth / wall.width;
			wall.scaleX = scale;
			wall.scaleY = scale;
		}
	}
}