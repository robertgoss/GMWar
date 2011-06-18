package  
{
	import Effects.Poisoned;
	import flash.display.SpreadMethod;
	import flash.display.Sprite;
    import net.flashpunk.FP;
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Graphiclist;
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
		public var flyingProp:Number;
		public var speed:Number;
		public var climbProp:Number;
		public var armour:Number;
        public var armourF:Boolean;
        public var armourI:Boolean;
        public var armourP:Boolean;
		public var health:Number;
        public var moveState:String;
		//Resistance
        private var damages:Array;

        private var curTrap:Trap;
        
        private var cableHeight:int;
        private var cableHeightTrue:int;

        public var xTrue:Number;
        private var yTrue:Number;

        public var lastpaused:Boolean;
		
		private var poisonEffect:Poisoned;
		private var isPoisoned:Boolean = false;
		
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
            xTrue = x;
			y = yPos;
            yTrue = y;

			dead = false;
			
			//Norm person set-up
			speed = 1;
			
            lastpaused = false;
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
			
			poisonEffect = new Poisoned(x-37, y-imageRun.scaledHeight, this);
		}
		
		private function AtEnd():void
		{
			
		}
		
		public function onTrap():void
        {
            var trapNew:Trap = (FP.world as Environment).trapMgr.trapAt(xTrue)      
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
                    if(yTrue!=floor())
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
                gSpeed = gSpeed*dam.slows()
            }
            return gSpeed;
        }
    
        public function flipAni():void
        {
            if(imageRun.rate==0)
            {
                imageRun.rate=1;
                imageClimb.rate=1;
                imageFall.rate=1;
            }else
            {
                imageRun.rate=0;
                imageClimb.rate=0;
                imageFall.rate=0;
            }
        }
		
		override public function update():void
		{
            var paused:Boolean = (FP.world as Environment).paused
            if(paused!=lastpaused)
            {
                lastpaused = paused;
                flipAni()
            }

            if(paused)
            {
                 return;
            }

              
			//Check if decsion is needed
			//Make decsion if needed
			//else continue current action
            onTrap();
			move();

            updateDamages();
            xTrue;
            yTrue;

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
            xTrue += gameSpeed();
            //x += 0.5;
			if (xTrue >= 1500) 
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
            yTrue -= (speed + (speed*climbProp))*0.15;
            if(yTrue<cableHeightTrue+50)
            {
                yTrue = cableHeightTrue;
                xTrue += 25
                if(xTrue>(curTrap.xTrue+curTrap.tWidth-curTrap.rRap))
                {
                    xTrue = curTrap.xTrue+curTrap.tWidth-curTrap.rRap
                }
                startWalking();
            }
        }

        public function startClimbing():void
        {
            graphic = imageClimb;
            imageClimb.play("run")
            moveState = "Climbing";
            xTrue += curTrap.lRap
            cableHeightTrue = floor()-curTrap.tHeight;
        }

        public function falling():void
        {
            yTrue += (speed + (speed*climbProp))*0.1;
            if(yTrue>floor())
            {
                yTrue = floor()
                xTrue += 36;
                startWalking();
            }
        }

        public function startFalling():void
        {
            graphic = imageFall;
            imageFall.play("run")
            moveState = "Falling";
            cableHeightTrue = yTrue;
            yTrue += 50;
        }

        public function flying():void
        {

        } 

        

        public function singlerender():void
        {
            super.render();
            //Draw.line(x,floor(),x,0,0xFFFFFF)
            if(moveState=="Climbing")
            {
                Draw.line(x-9,y-50,x,cableHeight,0xFFFFFF)
            }
            if(moveState=="Falling")
            {
                Draw.line(x+9,y-50,x,cableHeight,0xFFFFFF)
            }
        }

        public override function render():void
        {
            if(xTrue>750)
            {
                x = xTrue - 800;
                y = yTrue + (FP.world as Environment).yDiff;
                cableHeight = cableHeightTrue + (FP.world as Environment).yDiff;
                singlerender()
            }
            if(xTrue<850)
            {
                x = xTrue
                y = yTrue
                cableHeight = cableHeightTrue
                singlerender()
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
				if (isPoisoned == false)
				{
					FP.world.add(poisonEffect);
					isPoisoned == true;
				}
            }
			else if (isPoisoned == true )
			{
				FP.world.remove(poisonEffect);
				isPoisoned = false;
			}
            health = health - hurt;
			
			if (health <= 0)
			{
				dead = true;
				FP.world.add(new Angel(x - 37,y - imageRun.scaledHeight));
			}
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
		    person.speed = seq[1]*0.1+0.22;
		    person.climbProp = seq[2];
		    person.armour = seq[3];
            person.health = 100 + 10*seq[4]
            if(seq[5]>6)
            {
                person.armourF = true;
            }else
            {
                person.armourF = false
            }
            if(seq[6]>6)
            {
                person.armourI = true;
            }else
            {
                person.armourI = false
            }
            if(seq[7]>6)
            {
                person.armourP = true;
            }else
            {
                person.armourP = false
            }
        }

        public function getSeq():Array
		{
            var seq:Array = []
            seq[0] = flyingProp;
            seq[1] = speed*10 - 2.2;
            seq[2] = climbProp;
            seq[3] = armour;
            seq[4] = (health-100)*0.1;
            if(armourF)
            {
                seq[5] = 8
            }else
            {
                seq[5] = 0
            }
            if(armourI)
            {
                seq[6] = 8
            }else
            {
                seq[6] = 0
            }
            if(armourP)
            {
                seq[7] = 8
            }else
            {
                seq[7] = 0
            }
            return seq;
        }
	}
	
}
