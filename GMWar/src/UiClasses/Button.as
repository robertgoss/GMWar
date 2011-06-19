package UiClasses 
{
	import flash.display.Graphics;
	import net.flashpunk.Entity;
	import flash.events.MouseEvent;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.utils.Input;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.Graphic
	
	/**
	 * ...
	 * @author David
	 */
	
	 /* Trap numbering:
	  * 0 - Wall
	  * 1 - Tall Wall
	  * 2 - Spike Pit
	  * 3 - Fire Pit
	  * 4 - Gas Pit
	  * 5 - Tar Pit 
	  * 6 - Turret
	  * 7 - Flaming Turret
	  * 8 - Frezing Turret
	  * 9 - Vemon Turret
	  * 10 - Slowing Turret
	  * 11 - Hover Turret
	  * 12 - Flamming Hover Turret
	  * 13 - Freezing Hover Turret
	  * 14 - Vemon Hover Turret
	  * 15 - Slowing Hover Turret
	  * 16 - House of Flying Badgers
	  * 17 - Burning House
	  * 18 - Gas House
	  */ 
	 
	public class Button extends Entity 
	{
		[Embed(source = '../Asserts/buttonBlue.png')]
		private const BUTTON:Class;
		private var image:Spritemap = new Spritemap(BUTTON, 77, 77);
		
		//Icons
		[Embed(source = '../Asserts/Icons.png')]
		private const ICONS:Class;
		private var iconImage:Spritemap = new Spritemap(ICONS, 39, 39);
		
		
		private var roleOver:Function = null;
		private var click:Function = null;
		private var clicked:Boolean = false;
		private var trapNo:int;
		
		public function Button(x_:int, trap:int = -1) 
		{
			super(x_, 260, image);
			image.frame = 0;
			layer = -5;
			trapNo = trap;
			setHitbox(77, 77);
			FP.stage.addEventListener(MouseEvent.CLICK, buttonClick);
			
			var tempGraphic:Graphic;
			tempGraphic = iconImage;
			switch (trapNo) 
			{
				case 0: iconImage.frame = 0;
				//Short wall
					
				break;
				case 1: iconImage.frame = 1;
				//Tall wall
					
				break;
				case 2: iconImage.frame = 2;
				//Spike pit
					
				break;
				case 3: iconImage.frame = 3;
				//Flame pit
					
				break;
				case 4: iconImage.frame = 4;
				//Gas pit
					
				break;
				case 5: iconImage.frame = 5;
				//Tar pit
					
				break;				
				case 6: iconImage.frame = 6;
				//Turret
					
				break;
				case 7: iconImage.frame = 7;
				//Flame turret
					
				break;
				case 8: iconImage.frame = 8;
				//Ice turret
					
				break;
				case 9: iconImage.frame = 9;
				//Poison turret
					
				break;
				case 10: iconImage.frame = 10;
				//Large turret
				
				break;				
				case 11: iconImage.frame = 11;
				//Hover turret
				
				break;
				case 12: iconImage.frame = 12;
				//Hover flame turret
				
				break;
				case 13: iconImage.frame = 13;
				//Hover ice turret
				
				break;
				case 14: iconImage.frame = 14;
				//Hover poison turret
				
				break;				
				case 15: iconImage.frame = 15;
				//House of flying badgers
				
				break;
				case 16: iconImage.frame = 16;
				//Fire house
				
				break;
				case 17: iconImage.frame = 18;
				//Poison house
				
				break; 
				default: iconImage.frame = 19;
				//Remove Icon
					
				break;
			}
			tempGraphic.x = 19;
			tempGraphic.y = 23;
			
			addGraphic(tempGraphic);
		}
		
		public function buttonClick(e:MouseEvent=null):void
		{
			if (collidePoint(x, y, Input.mouseX, Input.mouseY))
			{
				clicked = true;
				image.frame = 1;
				UI.currentFocus = trapNo;
				FP.stage.addEventListener(MouseEvent.CLICK, loseFocus);
			}
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
			/*
			if (collidePoint(x, y, Input.mouseX, Input.mouseY))
			{
				if (roleOver != null)
				{
					UI.roledOver = trapNo;
					roleOver();
				}
			}
			*/
		}
	}
}
