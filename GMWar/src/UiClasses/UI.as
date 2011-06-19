package UiClasses
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import flash.events.MouseEvent;

	/**
	 * ...
	 * @author David
	 */
	public class UI
	{		
		public static var currentFocus:int = -1;
		public static var roledOver:int = -1;
		private var scrolling:int = 0;
		
		public function UI() 
		{
			// Add buttons to screen //////////////////////////////////////////////
			FP.world.add(new Scroll(0, true, scrollL));
			FP.world.add(new Scroll(762, false, scrollR));
			FP.world.add(new button(70));
		}
		
		public function scrollL():void
		{
			scrolling--;
			trace("1");
		}
		
		public function scrollR():void
		{
			scrolling++;
			trace("-1");
		}
		
		
	}

}