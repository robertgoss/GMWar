package 
{
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Draw;
	
	/**
	 * ...
	 * @author David
	 */
	public class Main extends Engine 
	{

		public function Main():void 
		{
			super(800, 600);
			FP.screen.color = 0xFFFFFF;
			FP.console.enable();
			FP.world = new Environment();
		}

	}
	
}
