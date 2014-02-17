package robotlegs.bender.signalMap.impl
{
	import org.osflash.signals.ISignal;
	
	import robotlegs.bender.signalMap.api.ISignalMap;

	public class SignalMap implements ISignalMap
	{
		private var signals:Vector.<ISignal> = new Vector.<ISignal>;
		public function mapListener(signal:ISignal, listener:Function):void
		{
			signal.add(listener);
			signals.push(signal);
		}
		public function unmapListener(signal:ISignal, listener:Function):void
		{
			signal.remove(listener);
			signals.splice(signals.indexOf(signal), 1);
		}
		public function unmapListeners():void
		{
			for each (var signal:ISignal in signals)
			{
				signal.removeAll();
			}
		}
	}
}