package UiClasses 
{
	import flash.net.URLRequest;
	import net.flashpunk.Entity;
	import flash.events.MouseEvent;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.utils.Input
	import net.flashpunk.graphics.Text;
	import traps.BurningHouse;
	import traps.FlammingHoverTurret;
	import traps.FlammingTurret;
	import traps.FreezingTurret;
	import traps.GasHouse;
	import traps.HouseOfFlyingBadgers;
	import traps.HoverTurret;
	import traps.LargeTurret;
	import traps.SpikePit;
	import traps.VemonTurret;

       import traps.Tarpit;
    import traps.Turret;
    import traps.FirePit;
    import traps.PoisonTrap;
    import traps.Wall;
    import traps.TallWall;
	
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
	  * 10 - Large
	  * 11 - Hover Turret
	  * 12 - Flamming Hover Turret
	  * 13 - Freezing Hover Turret
	  * 14 - Vemon Hover Turret
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
		private var spikePitIcon:Image;
		private var firePitIcon:Image;
		private var gasPitIcon:Image;
		private var tarPitIcon:Image;
		private var turretIcon:Image;
		private var fireTurretIcon:Image;
		private var freezingTurretIcon:Image;
		private var vemonTurretIcon:Image;
		private var heavyTurrentIcon:Image;
		private var hoverTurretIcon:Image;
		private var fireHoverTurretIcon:Image;
		private var iceHoverTurretIcon:Image;
		private var vemonHoverTurretIcon:Image;
		private var houseBadgerIcon:Image;
		private var burningHouseIcon:Image;
		private var gasHouseIcon:Image;
		private var removeIcon:Image;
		
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
			/*
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
				case 10: graphic =  heavyTurrentIcon;
				
				break;				
				case 11: graphic =  hoverTurretIcon;
				
				break;
				case 12: graphic =  fireHoverTurretIcon;
				
				break;
				case 13: graphic =  iceHoverTurretIcon;
				
				break;
				case 14: graphic =  vemonHoverTurretIcon;
				
				break;
				
				case 15: graphic =  houseBadgerIcon;
				
				break;
				case 16: graphic =  burningHouseIcon;
				
				break;
				case 17: graphic =  gasHouseIcon;
				
				break; 
				default:
					graphic = removeIcon;
					
				break;
			}*/
		}
		
		public function buttonClick(e:MouseEvent=null):void
		{
			if (collidePoint(x, y, Input.mouseX, Input.mouseY))
			{
				clicked = true;
				image.frame = 1;
				UI.currentFocus = trapNo;
				FP.stage.addEventListener(MouseEvent.CLICK, attempt);
			}
		}

        public function attempt(e:MouseEvent=null):void
        {
            var xTrue:int = Input.mouseX
            var yTrue:int = Input.mouseY
            if(y>300)
            {
                xTrue += 800;
                yTrue = (FP.world as Environment).floorHieght(xTrue)+350;
            }else
            {
                yTrue = (FP.world as Environment).floorHieght(xTrue);
            }
            switch(trapNo)
            {
                case -1:
                    if((FP.world as Environment).trapMgr.removeTrapAt(xTrue,yTrue))
                    {
                        loseFocus();
                    }
                    break;
                case 0:
                    if((FP.world as Environment).trapMgr.addTrap(new Wall(xTrue)))
                    {
                        loseFocus();
                    }
                    break;
                case 1:
                    if((FP.world as Environment).trapMgr.addTrap(new TallWall(xTrue)))
                    {
                        loseFocus();
                    }
                    break;
				case 2:
                    if((FP.world as Environment).trapMgr.addTrap(new SpikePit(xTrue)))
                    {
                        loseFocus();
                    }
                    break;
				case 3:
                    if((FP.world as Environment).trapMgr.addTrap(new FirePit(xTrue)))
                    {
                        loseFocus();
                    }
                    break;
				case 4:
                    if((FP.world as Environment).trapMgr.addTrap(new PoisonTrap(xTrue)))
                    {
                        loseFocus();
                    }
                    break;
				case 5:
                    if((FP.world as Environment).trapMgr.addTrap(new Tarpit(xTrue)))
                    {
                        loseFocus();
                    }
                    break;
				case 6:
                    if((FP.world as Environment).trapMgr.addTrap(new Turret(xTrue)))
                    {
                        loseFocus();
                    }
                    break;
				case 7:
                    if((FP.world as Environment).trapMgr.addTrap(new FlammingTurret(xTrue)))
                    {
                        loseFocus();
                    }
                    break;
				case 8:
                    if((FP.world as Environment).trapMgr.addTrap(new FreezingTurret(xTrue)))
                    {
                        loseFocus();
                    }
                    break;
				case 9:
                    if((FP.world as Environment).trapMgr.addTrap(new VemonTurret(xTrue)))
                    {
                        loseFocus();
                    }
                    break;
				case 10:
                    if((FP.world as Environment).trapMgr.addTrap(new LargeTurret(xTrue)))
                    {
                        loseFocus();
                    }
                    break;
				case 11:
                    if((FP.world as Environment).trapMgr.addTrap(new HoverTurret(xTrue)))
                    {
                        loseFocus();
                    }
                    break;
				case 12:
                    if((FP.world as Environment).trapMgr.addTrap(new FlammingHoverTurret(xTrue)))
                    {
                        loseFocus();
                    }
                    break;
				case 13:
                    if((FP.world as Environment).trapMgr.addTrap(new FreezingHoverTurret(xTrue)))
                    {
                        loseFocus();
                    }
                    break;
				case 14:
                    if((FP.world as Environment).trapMgr.addTrap(new VemonHoverTurret(xTrue)))
                    {
                        loseFocus();
                    }
                    break;
				case 15:
                    if((FP.world as Environment).trapMgr.addTrap(new HouseOfFlyingBadgers(xTrue)))
                    {
                        loseFocus();
                    }
                    break;
				case 16:
                    if((FP.world as Environment).trapMgr.addTrap(new BurningHouse(xTrue)))
                    {
                        loseFocus();
                    }
                    break;
				case 17:
                    if((FP.world as Environment).trapMgr.addTrap(new GasHouse(xTrue)))
                    {
                        loseFocus();
                    }
                    break;
            }
            
        }
		
		public function loseFocus():void
		{
			clicked = false;
			image.frame = 0;
			FP.stage.removeEventListener(MouseEvent.CLICK, attempt);	
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
