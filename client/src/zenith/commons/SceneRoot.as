package zenith.commons
{	
	import starling.display.DisplayObject;
	import starling.display.Sprite;
	
	public class SceneRoot extends Sprite
	{
		public function changeView(view:DisplayObject):void
		{
			removeChildren();
			addChild(view);
		}
	}
}