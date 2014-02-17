package zenith.context.game.commands
{
	import robotlegs.bender.bundles.mvcs.Command;
	
	import zenith.context.game.models.HeartbeatMachine;
	
	public class StartHeartbeatCommand extends Command
	{
		[Inject]
		public var machine:HeartbeatMachine;
		
		override public function execute():void
		{
			machine.start();
		}
	}
}