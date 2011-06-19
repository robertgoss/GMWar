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
		[Embed(source = 'Asserts/personS.png')]
		private const PLAYER:Class;
		private var image:Spritemap = new Spritemap(PLAYER, 37, 54); 
        [Embed(source = 'Asserts/hat.png')]
		private const HAT:Class;
		private var imageHat:Spritemap = new Spritemap(HAT, 12, 12); 
		private var dead:Boolean;
		private var trapOn:int;
		public var flyingB:Boolean;
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
			image.add("run", [ 0, 1, 2, 3, 4], 15, true);
            image.add("fall", [ 5, 6, 7, 8, 9], 15, true);
            image.add("climb", [ 10, 11, 12, 13, 14], 15, true);
            image.y = -54;
            image.x = -36;
			graphic = image;
			x = xPos as Number;
            xTrue = x;
			y = yPos;
            yTrue = y;

			dead = false;
			
			//Norm person set-up
			speed = 1;
			
            lastpaused = false;
			flyingB = false;
			climbProp = 0;
			armour = 0;
            armourF = false;
            armourI = false;
            armourP = false
            health = 1000;

            damages = []

            curTrap = null;

			image.play("run");
            moveState = "Walking"
			
			poisonEffect = new Poisoned(x-37, y-image.height, this);
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
            if(image.rate==0)
            {
                image.rate=1;
            }else
            {
                image.rate=0;
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
            image.play("run")
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
            image.play("climb")
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
                image.x = -37;
            }
        }

        public function startFalling():void
        {
            image.play("fall")
            moveState = "Falling";
            cableHeightTrue = yTrue;
            yTrue += 50;
            image.x = 0
        }

        public function flying():void
        {

        } 

        public function drawHat():void
        {
            if(moveState=="Walking")
            {
                Draw.graphic(imageHat,x-22,y-60)
            }
            if(moveState=="Climbing")
            {
                Draw.graphic(imageHat,x-34,y-58)
            }
            if(moveState=="Falling")
            {
                Draw.graphic(imageHat,x+24,y-58)
            }
        }

        public function singlerender():void
        {
            super.render();
            if(flyingB)
            {
                drawHat();
            }
            //Draw.line(x,y,x,y-100,0xFFFFFF)
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
				FP.world.add(new Angel(x - 37,y - image.height));
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
            if(seq[0]>7)
            {
                person.flyingB = true;
            }else
            {
                person.flyingB = false
            }
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
            if(flyingB)
            {
                seq[0] = 8
            }else
            {
                seq[0] = 0
            }
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
