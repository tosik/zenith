package robotlegs.bender.signalMap.impl
{
	import org.osflash.signals.ISignal;
	
	import robotlegs.bender.signalMap.api.ISignalMap;

	public class SignalMap implements ISignalMap
	{
		private var signals:Vector.<Object> = new Vector.<Object>;
		public function mapListener(signal:ISignal, listener:Function):void
		{
			signal.add(listener);
			signals.push( { signal: signal, listener: listener });
		}
		public function unmapListener(signal:ISignal, listener:Function):void
		{
			signal.remove(listener);
			signals.splice(signals.indexOf(signal), 1);
		}
		public function unmapListeners():void
		{
			for each (var obj:Object in signals.concat())
			{
				unmapListener(obj.signal, obj.listener);
			}
		}
	}
}