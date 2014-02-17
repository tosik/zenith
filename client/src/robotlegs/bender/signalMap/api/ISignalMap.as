package robotlegs.bender.signalMap.api
{
	import org.osflash.signals.ISignal;

	public interface ISignalMap
	{
		function mapListener(signal:ISignal, listener:Function):void;
		function unmapListener(signal:ISignal, listener:Function):void;
		function unmapListeners():void;
	}
}