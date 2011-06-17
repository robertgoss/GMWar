package  
{
	import net.flashpunk.Entity;
	
	public class People extends Entity
	{
		
		[Embed(source = 'Soldier.bmp')]
		private const PLAYER:Class;
		private var dead:Boolean;
		
		
		public function People(xPos:int = 0, yPos:int = 200) 
		{
			graphic = image;
			x = xPos;
			y = yPos;
			dead = false;
		}
		
		override public function update():void
		{
			x += 0.2;
			if (x >= 800) dead = true;
		}
		
		public function IsDead():Boolean
		{
			return dead;
		}
		
	}
	
}