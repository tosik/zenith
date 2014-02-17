package zenith.context.game
{
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	
	import zenith.commons.Config;
	import zenith.commons.signals.HeartbeatSignal;
	import zenith.context.game.commands.FlapPlaneCommand;
	import zenith.context.game.commands.StartHeartbeatCommand;
	import zenith.context.game.commands.UpdateObstacleCommand;
	import zenith.context.game.commands.UpdatePlaneCommand;
	import zenith.context.game.models.HeartbeatMachine;
	import zenith.context.game.models.ObstacleMaker;
	import zenith.context.game.models.ObstacleViewFactory;
	import zenith.context.game.models.Plane;
	import zenith.context.game.signals.GameViewAppended;
	import zenith.context.game.signals.WindowTouched;
	import zenith.context.game.views.GameView;
	import zenith.context.game.views.GameViewMediator;
	import zenith.context.game.views.ObstacleView;
	import zenith.context.game.views.ObstacleViewMediator;
	import zenith.context.game.views.PlaneView;
	import zenith.context.game.views.PlaneViewMediator;
	
	public class GameConfig extends Config
	{
		override public function configure():void
		{
			configureHeartbeatMachine();
			configureWindowTouch();
			
			// signals
			injector.map(GameViewAppended).asSingleton();
			
			// models
			injector.map(Plane).asSingleton();
			injector.map(ObstacleMaker).asSingleton();
			injector.map(ObstacleViewFactory).asSingleton();
			
			// mediators
			mediatorMap.map(GameView).toMediator(GameViewMediator);
			mediatorMap.map(PlaneView).toMediator(PlaneViewMediator);
			mediatorMap.map(ObstacleView).toMediator(ObstacleViewMediator);
			
			// commands
			signalCommandMap.map(HeartbeatSignal).toCommand(UpdatePlaneCommand);
			signalCommandMap.map(HeartbeatSignal).toCommand(UpdateObstacleCommand);
			signalCommandMap.map(GameViewAppended).toCommand(StartHeartbeatCommand);
			signalCommandMap.map(WindowTouched).toCommand(FlapPlaneCommand);
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