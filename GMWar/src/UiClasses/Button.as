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
		private var wallIcon:Image;
		private var tallWallIcon:Image;
		private var spikePitIcon:Image;
		private var firePitIcon:Image;
		private var gasPitIcon:Image;
		private var tarPitIcon:Image;
		private var turretIcon:Image;
		private var fireTurretIcon:Image;
		private var freezingTurretIcon:Image;
		private var vemonTurretIcon:Image;
		private var slowTurrentIcon:Image;
		private var hoverTurretIcon:Image;
		private var fireHoverTurretIcon:Image;
		private var iceHoverTurretIcon:Image;
		private var vemonHoverTurretIcon:Image;
		private var slowHoverTurretIcon:Image;
		private var houseBadgerIcon:Image;
		private var burningHouseIcon:Image;
		private var gasHouseIcon:Image;
		
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
				case 2: graphic = spikePitIcon;
					
				break;
				
				case 3: graphic = firePitIcon;
					
				break;
				case 4: graphic = gasPitIcon;
					
				break;
				case 5: graphic = tarPitIcon;
					
				break;
				
				case 6: graphic = turretIcon;
					
				break;
				case 7: graphic = fireTurretIcon;
					
				break;
				case 8: graphic = freezingTurretIcon;
					
				break;
				case 9: graphic = vemonTurretIcon;
					
				break;
				case 10: graphic =  slowTurrentIcon;
				
				break;
				
				case 11: graphic =  hoverTurretIcon;
				
				break;
				case 12: graphic =  fireHoverTurretIcon;
				
				break;
				case 13: graphic =  iceHoverTurretIcon;
				
				break;
				case 14: graphic =  vemonHoverTurretIcon;
				
				break;
				case 15: graphic =  slowHoverTurretIcon;
				
				break;
				
				case 16: graphic =  houseBadgerIcon;
				
				break;
				case 17: graphic =  burningHouseIcon;
				
				break;
				case 18: graphic =  gasHouseIcon;
				
				break;
				default:
					
				break;
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