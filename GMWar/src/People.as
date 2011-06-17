package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	
	public class People extends Entity
	{
		[Embed(source = 'Soldier.png')]
		private const PLAYER:Class;
		private var image:Image = new Image(PLAYER);
		private var dead:Boolean;
		private var trapOn:int;
		private var flying:int;
		private var speed:int;
		private var climb:int;
		private var armour:int;
		private var health:Number;
		//Resistance
		
		public function People(xPos:int = 0, yPos:int = 200) 
		{
			image.scale = 0.2;
			graphic = image;
			x = xPos;
			y = yPos;
			dead = false;
			
			//Normal person set-up
			speed = 1;
			
			flying = 0;
			climb = 0;
			armour = 0;
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
		
		public function IsDead():Boolean
		{
			return dead;
		}
		
	}
	
}
