package zenith.context.game.views
{
	import starling.display.DisplayObject;
	import starling.display.Image;
	import starling.display.Quad;
	import starling.display.Sprite;
	import starling.textures.Texture;
	
	public class ObstacleView extends Sprite
	{
		[Embed(source="assets/wall.png")]
		private static const ObstacleImage:Class;

		private var upperImage:Image;
		private var lowerImage:Image;
		private var _checkpoint:DisplayObject;

		public function ObstacleView(height:Number)
		{
			var texture:Texture = Texture.fromEmbeddedAsset(ObstacleImage);
			upperImage = new Image(texture);
			lowerImage = new Image(texture);
			
			upperImage.height = 16 * 32;
			upperImage.width = 4 * 32;
			upperImage.y = - upperImage.height + height * 32;
			
			lowerImage.height = 16 * 32;
			lowerImage.width = 4 * 32;
			lowerImage.y = upperImage.bounds.bottom + 8 * 32;
			
			addChild(upperImage);
			addChild(lowerImage);

			_checkpoint = new Quad(1, 1000, 0, false);
			_checkpoint.x = upperImage.width;
			_checkpoint.y = 0;
			_checkpoint.alpha = 0;
			addChild(_checkpoint);
		}
		
		public function get realObstacles():Vector.<DisplayObject>
		{
			return Vector.<DisplayObject>([upperImage, lowerImage]);
		}
		
		public function get checkpoint():DisplayObject
		{
			return _checkpoint;
		}
	}
}