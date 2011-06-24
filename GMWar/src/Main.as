package 
{
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Draw;
	import net.flashpunk.utils.Key;
	
	/**
	 * ...
	 * @author David
	 */
	public class Main extends Engine 
	{

		public function Main():void 
		{
			super(800, 600);
			FP.screen.color = 0x222222;
			//FP.console.enable();
			FP.world = new Intro();
		}

	}
	
}
