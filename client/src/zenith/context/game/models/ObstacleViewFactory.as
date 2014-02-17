package zenith.context.game.models
{
	import zenith.context.game.views.ObstacleView;

	public class ObstacleViewFactory
	{
		public function create(obstacle:Obstacle):ObstacleView
		{
			var view:ObstacleView = new ObstacleView(obstacle.height);
			return view;
		}
	}
}