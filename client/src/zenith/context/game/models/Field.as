package zenith.context.game.models
{
	import flash.geom.Rectangle;

	public class Field
	{
		private var _rectangle:Rectangle = null;

		public function Field()
		{
		}
		
		public function get rectangle():Rectangle
		{
			return _rectangle ||= new Rectangle(0, 0, 300, 500);
		}
	}
}