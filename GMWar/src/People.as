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
		public var flyingProp:int;
		public var speed:Number;
		public var climbProp:int;
		public var armour:int;
        public var armourF:Boolean;
        public var armourI:Boolean;
        public var armourP:Boolean;
		public var health:Number;
        public var moveState:String;
		//Resistance
        private var damages:Array;

        private var curTrap:Trap;
        
        private var cableHeight:int;
		
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
            var gSpeed:Number = speed;
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
                x += 25
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
                x += 36;
                startWalking();
            }
        }

        public function startFalling():void
        {
            graphic = imageFall;
            imageFall.play("run")
            moveState = "Falling";
            cableHeight = y;
            y+=50;
        }

        public function flying():void
        {

        } 

        public override function render():void
        {
            super.render();
            //Draw.line(x,floor(),x,0,0xFFFFFF)
            if(moveState=="Climbing")
            {
                Draw.line(x-10,y-50,x,-curTrap.tHeight+floor(),0xFFFFFF)
            }
            if(moveState=="Falling")
            {
                Draw.line(x+10,y-50,x,cableHeight,0xFFFFFF)
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
        
        public function setSeq(seq:Array):void
        {
            var person:People = this
            person.flyingProp = seq[0];
		    person.speed = seq[1]*0.1;
		    person.climbProp = seq[2];
		    person.armour = seq[3];
            person.health = 100 + 10*seq[4]
            person.armourF = seq[5];
            person.armourI = seq[6];
            person.armourP = seq[7];
        }

        public function getSeq():Array
		{
            var seq:Array = []
            seq[0] = flyingProp;
            seq[1] = speed*10;
            seq[2] = climbProp;
            seq[3] = armour;
            seq[4] = (health-100)*0.1;
            seq[5] = armourF;
            seq[6] = armourI;
            seq[7] = armourP;
            return seq;
        }
	}
	
}
