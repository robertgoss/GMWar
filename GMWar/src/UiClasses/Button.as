package UiClasses 
{
	import net.flashpunk.Entity;
	import flash.events.MouseEvent;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.utils.Input
	import net.flashpunk.graphics.Text;
	
	/**
	 * ...
	 * @author David
	 */
	
	 /* Trap numbering:
	  * 0 - Wall
	  * 1 - Tall Wall
	  * 2 - Tarpit
	  * 3 - Fire Pit
	  * 4 - Gas Pit(poison pit)
	  * 5 - Turret
	  * 6 - Flaming Turret
	  * 7 - Frezing Turret
	  * 8 - Vemon Turret
	  * 9 - Slowing Turret
	  * 10 - Hover Turret
	  * 11 - Flamming Hover Turret
	  * 12 - Freezing Hover Turret
	  * 13 - Vemon Hover Turret
	  * 14 - Slowing Hover Turret
	  * 15 - House of Flying Badgers
	  * 16 - Burning House
	  * 17 - Gas House
	  */ 
	 
	public class Button extends Entity 
	{
		[Embed(source = '../Asserts/buttonBlue.png')]
		private const BUTTON:Class;
		private var image:Spritemap = new Spritemap(BUTTON, 77, 77);
		
		//Icons
		private var wallIcon:Image;
		private var tallWallIcon:Image;
		private var tarpitIcon:Image;
		private var firePitIcon:Image;
		private var gasPitIcon:Image;
		private var turretIcon:Image;
		private var freezingTurretIcon:Image;
		private var vemonTurretIcon:Image;
		
		private var houseOfFlyingBadgersIcon:Image;
		
		private var roleOver:Function = null;
		private var click:Function = null;
		private var clicked:Boolean = false;
		private var trapNo:int;
		
		public function Button(x_:int, trap:int = -1) 
		{
			super(x_, 260, image);
			image.frame = 0;
			trapNo = trap;
			setHitbox(77, 77);
			FP.stage.addEventListener(MouseEvent.CLICK, buttonClick);
			
			switch (trapNo) 
			{
				case 0: graphic = wallIcon;
					
				break;
				case 1: graphic = tallWallIcon;
					
				break;
				case 2: graphic = tarpitIcon;
					
				break;
				case 3: graphic = firePitIcon;
					
				break;
				case 4: graphic = gasPitIcon;
					
				break;
				case 5: graphic = turretIcon;
					
				break;
				case 6: graphic = freezingTurretIcon;
					
				break;
				case 7: graphic = vemonTurretIcon;
					
				break;
				case 8: graphic = houseOfFlyingBadgersIcon;
					
				break;
				/*default:
					
				break;*/
			}
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
