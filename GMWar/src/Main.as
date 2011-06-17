package 
{
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author David
	 */
	public class Main extends Engine 
	{
		
		public function Main():void 
		{
			super(800, 600);
			FP.console.enable();
			FP.world = new Environment();
		}
	}
	
}