package zenith.context.game.views
{
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.textures.Texture;
	
	public class ObstacleView extends Sprite
	{
		[Embed(source="assets/wall.jpg")]
		private static const ObstacleImage:Class;

		private var upperImage:Image;
		private var lowerImage:Image;

		public function ObstacleView(height:Number)
		{
			var texture:Texture = Texture.fromEmbeddedAsset(ObstacleImage);
			upperImage = new Image(texture);
			lowerImage = new Image(texture);
			
			upperImage.height = height * 32;
			upperImage.width = 5 * 32;
			
			lowerImage.y = height * 32 + 256;
			lowerImage.height = 1000 - lowerImage.y;
			lowerImage.width = 5 * 32;
			
			addChild(upperImage);
			addChild(lowerImage);
		}
	}
}