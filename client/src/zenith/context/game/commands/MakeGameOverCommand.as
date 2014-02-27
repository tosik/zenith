package zenith.context.game.commands
{
	import robotlegs.bender.bundles.mvcs.Command;
	
	import zenith.commons.VisualEffectGenerator;
	import zenith.context.game.models.HeartbeatMachine;
	import zenith.context.game.models.Plane;
	
	public class MakeGameOverCommand extends Command
	{
		[Inject]
		public var heartbeatMachine:HeartbeatMachine;

		[Inject]
		public var plane:Plane;
		
		[Inject]
		public var visualEffect:VisualEffectGenerator;
		
		override public function execute():void
		{
			heartbeatMachine.stop();
			plane.die();
			visualEffect.flash();
		}
	}
}