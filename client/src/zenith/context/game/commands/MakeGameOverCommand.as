package zenith.context.game.commands
{
	import robotlegs.bender.bundles.mvcs.Command;
	
	import zenith.context.game.models.HeartbeatMachine;
	
	public class MakeGameOverCommand extends Command
	{
		[Inject]
		public var heartbeatMachine:HeartbeatMachine;

		override public function execute():void
		{
			heartbeatMachine.stop();
		}
	}
}