package  
{
	import flash.display.SpreadMethod;
	import flash.display.Sprite;
    import net.flashpunk.FP;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Spritemap;
	
	public class People extends Entity
	{
		[Embed(source = 'Asserts/runningNormal.png')]
		private const PLAYER:Class;
		private var image:Spritemap = new Spritemap(PLAYER, 74, 108); 
		private var dead:Boolean;
		private var trapOn:int;
		private var flying:int;
		private var speed:Number;
		private var climb:int;
		private var armour:int;
        private var armourF:Boolean;
        private var armourI:Boolean;
        private var armourP:Boolean;
		private var health:Number;
		//Resistance
        private var damages:Array;
        private var xTrue:Number;

        private var curTrap:Trap;
		
		public function People(xPos:int = 0, yPos:int = 200) 
		{
			image.scale = 0.5;
			image.add("run", [ 0, 1, 2, 3, 4], 15, true);
            image.y = -54;
			graphic = image;
			x = xPos as Number;
            xTrue = x as Number;
			y = yPos;
			dead = false;
			
			//Normal person set-up
			speed = 1;
			
			flying = 0;
			climb = 0;
			armour = 0;
            armourF = false;
            armourI = false;
            armourP = false
            health = 1000;

            damages = []

            curTrap = null;

			image.play("run");
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
                    curTrap.onTrapFirst(this)
                }
            }    
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
			
			x += gameSpeed();
            //x += 0.5;
			if (x >= 800) 
			{
				dead = true;
			}

            updateDamages();

            //Get current floor
            //y = (FP.world as Environment).floorHieght(x);
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
