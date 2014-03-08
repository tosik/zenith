package zenith.context.game.views
{
	import starling.display.Image;
	import starling.textures.Texture;
	
	public class BackgroundView extends Image
	{
		[Embed(source="assets/background.png")]
		private static const BackgroundImage:Class;
		
		public function BackgroundView()
		{
			var texture:Texture = Texture.fromEmbeddedAsset(BackgroundImage);
			super(texture);
		}
		
		public function layoutSubviews():void
		{
			var scale:Number = stage.stageWidth / this.width;
			this.scaleX = scale;
			this.scaleY = scale;
		}
	}
}