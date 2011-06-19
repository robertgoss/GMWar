package UiClasses 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Spritemap;
	import flash.events.MouseEvent;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Input
	/**
	 * ...
	 * @author David
	 */
	public class Scroll extends Entity 
	{
		[Embed(source = '../Asserts/ScrollButtonsB.png')]
		private const SCROLL:Class;
		private var image:Spritemap = new Spritemap(SCROLL, 38, 101);
		private var scrollCallback:Function = null;
		
		public function Scroll(x_:int,right:Boolean, callback:Function) 
		{
			graphic = image;
			super(x_, 247);
			if (right)
			{
				image.frame = 0;
			}
			else 
			{
				image.frame = 1;
			}
			setHitbox(24, 80, -7, -10);
			
			scrollCallback = callback;
			FP.stage.addEventListener(MouseEvent.CLICK, click);
		}
		
		public function click(e:MouseEvent=null):void
		{
			if (collidePoint(x, y, Input.mouseX, Input.mouseY))
			{
				scrollCallback();
			}
		}
		
	}

}