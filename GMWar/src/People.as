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
		private var speed:int;
		private var climb:int;
		private var armour:int;
		private var health:Number;
		//Resistance
        private var damages:Array;
		
		public function People(xPos:int = 0, yPos:int = 200) 
		{
			image.scale = 0.5;
			image.add("run", [ 0, 1, 2, 3, 4], 15, true);
			graphic = image;
			x = xPos;
			y = yPos;
			dead = false;
			
			//Normal person set-up
			speed = 1;
			
			flying = 0;
			climb = 0;
			armour = 0;
			image.play("run");
		}
		
		private function AtEnd():void
		{
			
		}
		
		
		
		override public function update():void
		{
			//Check if decsion is needed
			//Make decsion if needed
			//else continue current action
			
			x += speed;
			if (x >= 800) 
			{
				dead = true;
			}

            //Get current floor
            y = (FP.world as Environment).floorHieght(x);
		}

        public function addDamage(damage:Damage):void
        {
            damage.target = this;
            damages.push(damage)
        }
		
		public function IsDead():Boolean
		{
			return dead;
		}
		
	}
	
}
