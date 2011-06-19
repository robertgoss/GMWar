package UiClasses 
{
	import net.flashpunk.Entity;
	import flash.events.MouseEvent;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.utils.Input
	
	/**
	 * ...
	 * @author David
	 */
	public class Button extends Entity 
	{
		[Embed(source = '../Asserts/buttonBlue.png')]
		private const BUTTON:Class;
		private var image:Spritemap = new Spritemap(BUTTON, 77, 77);
		
		private var roleOver:Function = null;
		private var click:Function = null;
		private var clicked:Boolean = false;
		private var trapNo:int;
		
		public function button(x_:int, trap:int = -1) 
		{
			super(x_, 260, image);
			image.frame = 0;
			trapNo = trap;
			setHitbox(77, 77);
			FP.stage.addEventListener(MouseEvent.CLICK, buttonClick);
			
			switch (trapNo) 
			{
				case 0:
					
				break;
				default:
					
				break;
			}
		}
		
		public function scroll(xDist:int):void
		{
			x += xDist;
		}
		
		public function buttonClick(e:MouseEvent=null):void
		{
			clicked = true;
			image.frame = 1;
			UI.currentFocus = trapNo;
			FP.stage.addEventListener(MouseEvent.CLICK, loseFocus);
		}
		
		public function loseFocus(e:MouseEvent=null):void
		{
			clicked = false;
			image.frame = 0;
			FP.stage.removeEventListener(MouseEvent.CLICK, loseFocus);	
		}
		
		override public function update():void 
		{
			super.update();
			if (collidePoint(x, y, Input.mouseX, Input.mouseY))
			{
				if (roleOver != null)
				{
					UI.roledOver = trapNo;
					roleOver();
				}
			}
		}
	}

}