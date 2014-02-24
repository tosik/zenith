package zenith.context.game.commands
{
	import robotlegs.bender.bundles.mvcs.Command;
	
	import zenith.context.game.models.Score;
	
	public class IncreaseScoreCommand extends Command
	{
		[Inject]
		public var score:Score;
		
		override public function execute():void
		{
			score.value += 1;
		}
	}
}