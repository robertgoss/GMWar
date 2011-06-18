package  
{
	import flash.display.SpreadMethod;
	import flash.display.Sprite;
    import net.flashpunk.FP;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Spritemap;
    import net.flashpunk.utils.Draw;
	
	public class People extends Entity
	{
		[Embed(source = 'Asserts/runningNormalInv.png')]
		private const PLAYERRUN:Class;
		private var imageRun:Spritemap = new Spritemap(PLAYERRUN, 74, 108); 
        [Embed(source = 'Asserts/climbingInv.png')]
		private const PLAYERCLIMB:Class;
		private var imageClimb:Spritemap = new Spritemap(PLAYERCLIMB, 74, 108); 
        [Embed(source = 'Asserts/fallingInv.png')]
		private const PLAYERFALL:Class;
		private var imageFall:Spritemap = new Spritemap(PLAYERFALL, 74, 108); 
		private var dead:Boolean;
		private var trapOn:int;
		private var flyingProp:int;
		private var speed:Number;
		private var climbProp:int;
		private var armour:int;
        private var armourF:Boolean;
        private var armourI:Boolean;
        private var armourP:Boolean;
		private var health:Number;
        private var moveState:String;
		//Resistance
        private var damages:Array;
        private var xTrue:Number;

        private var curTrap:Trap;
		
		public function People(xPos:int = 0, yPos:int = 200) 
		{
			imageRun.scale = 0.5;
			imageRun.add("run", [ 0, 1, 2, 3, 4], 15, true);
            imageRun.y = -54;
            imageRun.x = -36;
            imageClimb.scale = 0.5;
			imageClimb.add("run", [ 0, 1, 2, 3, 4], 15, true);
            imageClimb.y = -54;
            imageClimb.x = -36;
            imageFall.scale = 0.5;
			imageFall.add("run", [ 0, 1, 2, 3, 4], 15, true);
            imageFall.y = -54;
            imageFall.x = 0;
			graphic = imageRun;
			x = xPos as Number;
            xTrue = x as Number;
			y = yPos;
			dead = false;
			
			//Norm person set-up
			speed = 1;
			
			flyingProp = 0;
			climbProp = 0;
			armour = 0;
            armourF = false;
            armourI = false;
            armourP = false
            health = 1000;

            damages = []

            curTrap = null;

			imageRun.play("run");
            moveState = "Walking"
		}
		
		private function AtEnd():void
		{
			
		}
		
		public function onTrap():void
        {
            var trapNew:Trap = (FP.world as Environment).trapMgr.trapAt(x)      
            if(trapNew==curTrap)
            {
                if(curTrap!=null)
                {
                    curTrap.onTrap(this)
                }
            }else
            {
                curTrap = trapNew;
                if(curTrap!=null)
                {
                    if(stratagy())
                    {
                        curTrap.onTrapFirst(this);
                    }
                }else
                {
                    if(y!=floor())
                    {
                        startFalling();
                    }
                }
            }    
        }

        public function stratagy():Boolean
        {
            if(curTrap.blocking)
            {
                startClimbing();
                return false;
            }
            return true;
        }

        public function floor():int
        {
            return (FP.world as Environment).floorHieght(x)
        }

        public function gameSpeed():Number
        {
            var gSpeed:Number = 1;
            for each(var dam:Damage in damages)
            {
                if(!dam.isIce() || !armourI)
                {
                    gSpeed = dam.slows()
                }
            }
            return gSpeed;
        }
		
		override public function update():void
		{
			//Check if decsion is needed
			//Make decsion if needed
			//else continue current action
            onTrap();
			move();

            updateDamages();

            //Get current floor
		}

        public function move():void
        {
            
            if(moveState=="Walking")
            {
                    walking();
            }
            if(moveState=="Flying")
            {
                    flying();
            }
            if(moveState=="Climbing")
            {
                    climbing();
            }
            if(moveState=="Falling")
            {
                    falling();
            }
        }

        public function walking():void
        {
            x += gameSpeed();
            //x += 0.5;
			if (x >= 800) 
			{
				dead = true;
			}
        }

        public function startWalking():void
        {
            graphic = imageRun;
            imageRun.play("run")
            moveState = "Walking";
        }

        public function climbing():void
        {
            y -= (speed + (speed*climbProp))*0.1;
            if(y<(-curTrap.tHeight+floor()+50))
            {
                y = -curTrap.tHeight+floor()
                startWalking();
            }
        }

        public function startClimbing():void
        {
            graphic = imageClimb;
            imageClimb.play("run")
            moveState = "Climbing";
        }

        public function falling():void
        {
            y += (speed + (speed*climbProp))*0.1;
            if(y>floor())
            {
                y = floor()
                startWalking();
            }
        }

        public function startFalling():void
        {
            graphic = imageFall;
            imageFall.play("run")
            moveState = "Falling";
        }

        public function flying():void
        {

        } 

        public override function render():void
        {
            super.render();
            if(moveState=="Climbing")
            {
                Draw.line(x-10,y-50,x,-curTrap.tHeight+floor())
            }
        }
   

        public function harm(hurt:int,damage:Damage):void
        {
            hurt = hurt - armour
            if(hurt<0)
            {
                hurt = 0
            }
            if(damage.isFire() && armourF)
            {
                hurt = 0;
            }
            if(damage.isIce() && armourI)
            {
                hurt = 0;
            }  
            if(damage.isPoison() && armourP)
            {
                hurt = 0;
            }
            health = health - hurt;
        }

        public function addDamage(damage:Damage):void
        {
            damage.target = this;
            damages.push(damage)
        }

        public function updateDamages():void
        {
            var newDamages:Array = []
            for each(var damage:Damage in damages)
            {
                var hurt:int = damage.update()
                harm(hurt,damage)
                if(damage.alive)
                {
                   newDamages.push(damage); 
                }
            }   
            damages = newDamages;
        }
		
		public function IsDead():Boolean
		{
			return dead;
		}
		
	}
	
}
