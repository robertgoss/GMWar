package UiClasses 
{
	import flash.net.URLRequest;
	import net.flashpunk.Entity;
	import flash.events.MouseEvent;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.utils.Input;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.Graphic
	import traps.BurningHouse;
	import traps.FlammingHoverTurret;
	import traps.FlammingTurret;
	import traps.FreezingHoverTurret;
	import traps.FreezingTurret;
	import traps.GasHouse;
	import traps.HouseOfFlyingBadgers;
	import traps.HoverTurret;
	import traps.LargeTurret;
	import traps.SpikePit;
	import traps.VemonHoverTurret;
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
			var price:Text = new Text("0");

			switch (trapNo) 
			{
				case 0: iconImage.frame = 0;
				//Short wall
				price = new Text(Wall.price.toString());
					
				break;
				case 1: iconImage.frame = 1;
				//Tall wall
				price = new Text(TallWall.price.toString());
					
				break;
				case 2: iconImage.frame = 2;
				//Spike pit
				price = new Text(SpikePit.price.toString());
					
				break;
				case 3: iconImage.frame = 3;
				//Flame pit
				price = new Text(FirePit.price.toString());
					
				break;
				case 4: iconImage.frame = 4;
				//Gas pit
				price = new Text(PoisonTrap.price.toString());
					
				break;
				case 5: iconImage.frame = 5;
				//Tar pit
				price = new Text(Tarpit.price.toString());
					
				break;				
				case 6: iconImage.frame = 6;
				//Turret
				price = new Text(Turret.price.toString());
					
				break;
				case 7: iconImage.frame = 7;
				//Flame turret
				price = new Text(FlammingTurret.price.toString());
					
				break;
				case 8: iconImage.frame = 8;
				//Ice turret
				price = new Text(FreezingTurret.price.toString());
					
				break;
				case 9: iconImage.frame = 9;
				//Poison turret
				price = new Text(VemonTurret.price.toString());
					
				break;
				case 10: iconImage.frame = 10;
				//Large turret
				price = new Text(LargeTurret.price.toString());
				
				break;				
				case 11: iconImage.frame = 11;
				//Hover turret
				price = new Text(HoverTurret.price.toString());
				
				break;
				case 12: iconImage.frame = 12;
				//Hover flame turret
				price = new Text(FlammingHoverTurret.price.toString());
				
				break;
				case 13: iconImage.frame = 13;
				//Hover ice turret
				price = new Text(FreezingHoverTurret.price.toString());
				
				break;
				case 14: iconImage.frame = 14;
				//Hover poison turret
				price = new Text(VemonHoverTurret.price.toString());
				
				break;				
				case 15: iconImage.frame = 15;
				//House of flying badgers
				price = new Text(HouseOfFlyingBadgers.price.toString());
				
				break;
				case 16: iconImage.frame = 16;
				//Fire house
				price = new Text(BurningHouse.price.toString());
				
				break;
				case 17: iconImage.frame = 18;
				//Poison house
				price = new Text(GasHouse.price.toString());
				
				break; 
				default: iconImage.frame = 19;
				trapNo = -1;	
				//Remove Icon
					
				break;
			}
			tempGraphic.x = 19;
			tempGraphic.y = 23;
			
			addGraphic(tempGraphic);
			addGraphic(price);
			
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
            if(yTrue>250 && yTrue< 350)
            {
                loseFocus();
                return;
            }
            if(yTrue>300)
            {
                xTrue += 800;
            }
            yTrue = (FP.world as Environment).floorHieght(xTrue);
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
