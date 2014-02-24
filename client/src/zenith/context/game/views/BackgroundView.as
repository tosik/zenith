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
			this.width *= 6;
			this.height *= 6;
		}
	}
}