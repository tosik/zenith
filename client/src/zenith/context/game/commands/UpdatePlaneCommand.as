package zenith.context.game.commands
{
	import robotlegs.bender.bundles.mvcs.Command;
	
	import zenith.context.game.models.Plane;
	
	public class UpdatePlaneCommand extends Command
	{
		[Inject]
		public var plane:Plane;

		override public function execute():void
		{
			plane.fall();
		}
	}
}