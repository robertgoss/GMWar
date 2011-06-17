package  
{
	import net.flashpunk.Entity;
	
	public class People extends Entity
	{
		
		[Embed(source = 'Soldier.bmp')]
		private const PLAYER:Class;
		private var image:Image = new Image(PLAYER);
		private var dead:Boolean;
		private var trapOn:int;
		private var flying:int;
		private var speed:int;
		private var climb:int;
		private var armour:int;
		//Resistance
		
		private var dead:Boolean;
		
		
		public function People(xPos:int = 0, yPos:int = 200) 
		{
			graphic = image;
			x = xPos;
			y = yPos;
			dead = false;
			
			//Normal person set-up
			speed = 0.2;
			
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
			if (x >= 800) dead = true;
		}
		
		public function IsDead():Boolean
		{
			return dead;
		}
		
	}
	
}