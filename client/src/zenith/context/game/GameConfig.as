package zenith.context.game
{
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	
	import zenith.commons.Config;
	import zenith.commons.VisualEffectGenerator;
	import zenith.commons.signals.HeartbeatSignal;
	import zenith.context.game.commands.FlapPlaneCommand;
	import zenith.context.game.commands.IncreaseScoreCommand;
	import zenith.context.game.commands.MakeGameOverCommand;
	import zenith.context.game.commands.RestartGameCommand;
	import zenith.context.game.commands.StartHeartbeatCommand;
	import zenith.context.game.commands.UpdateObstacleCommand;
	import zenith.context.game.commands.UpdatePlaneCommand;
	import zenith.context.game.models.CheckpointDetector;
	import zenith.context.game.models.Field;
	import zenith.context.game.models.HeartbeatMachine;
	import zenith.context.game.models.ObstacleCollisionDetector;
	import zenith.context.game.models.ObstacleMaker;
	import zenith.context.game.models.ObstacleViewFactory;
	import zenith.context.game.models.Plane;
	import zenith.context.game.models.Score;
	import zenith.context.game.signals.CheckpointPassed;
	import zenith.context.game.signals.Collided;
	import zenith.context.game.signals.GameViewAppended;
	import zenith.context.game.signals.RestartRequested;
	import zenith.context.game.signals.WindowTouched;
	import zenith.context.game.views.BackgroundView;
	import zenith.context.game.views.BackgroundViewMediator;
	import zenith.context.game.views.GameOverView;
	import zenith.context.game.views.GameOverViewMediator;
	import zenith.context.game.views.GameView;
	import zenith.context.game.views.GameViewMediator;
	import zenith.context.game.views.GroundView;
	import zenith.context.game.views.GroundViewMediator;
	import zenith.context.game.views.ObstacleView;
	import zenith.context.game.views.ObstacleViewMediator;
	import zenith.context.game.views.PlaneView;
	import zenith.context.game.views.PlaneViewMediator;
	import zenith.context.game.views.ScoreView;
	import zenith.context.game.views.ScoreViewMediator;
	
	public class GameConfig extends Config
	{
		override public function configure():void
		{
			configureHeartbeatMachine();
			configureWindowTouch();
			
			// signals
			injector.map(GameViewAppended).asSingleton();
			injector.map(Collided).asSingleton();
			injector.map(RestartRequested).asSingleton();
			
			// models
			injector.map(Field).asSingleton();
			injector.map(Plane).asSingleton();
			injector.map(ObstacleMaker).asSingleton();
			injector.map(ObstacleViewFactory).asSingleton();
			injector.map(ObstacleCollisionDetector).asSingleton();
			injector.map(CheckpointDetector).asSingleton();
			injector.map(Score).asSingleton();
			injector.map(VisualEffectGenerator).asSingleton();
			
			// mediators
			mediatorMap.map(GameView).toMediator(GameViewMediator);
			mediatorMap.map(PlaneView).toMediator(PlaneViewMediator);
			mediatorMap.map(ObstacleView).toMediator(ObstacleViewMediator);
			mediatorMap.map(ScoreView).toMediator(ScoreViewMediator);
			mediatorMap.map(GameOverView).toMediator(GameOverViewMediator);
			mediatorMap.map(GroundView).toMediator(GroundViewMediator);
			mediatorMap.map(BackgroundView).toMediator(BackgroundViewMediator);
			
			// commands
			signalCommandMap.map(HeartbeatSignal).toCommand(UpdatePlaneCommand);
			signalCommandMap.map(HeartbeatSignal).toCommand(UpdateObstacleCommand);
			signalCommandMap.map(GameViewAppended).toCommand(StartHeartbeatCommand);
			signalCommandMap.map(WindowTouched).toCommand(FlapPlaneCommand);
			signalCommandMap.map(Collided).toCommand(MakeGameOverCommand);
			signalCommandMap.map(CheckpointPassed).toCommand(IncreaseScoreCommand);
			signalCommandMap.map(RestartRequested).toCommand(RestartGameCommand);
		}
		
		private function configureHeartbeatMachine():void
		{
			injector.map(HeartbeatSignal).asSingleton();
			injector.map(HeartbeatMachine).asSingleton();
		}
		
		private function configureWindowTouch():void
		{
			injector.map(WindowTouched).asSingleton();
			starling.stage.addEventListener(TouchEvent.TOUCH, function(e:TouchEvent):void {
				if (e.getTouch(starling.stage) && e.getTouch(starling.stage).phase == TouchPhase.BEGAN)
					injector.getInstance(WindowTouched).dispatch();
			});
		}
	}
}