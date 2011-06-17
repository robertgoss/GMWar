package  
{
	import net.flashpunk.Entity;
	
	public class People extends Entity
	{
		
		[Embed(source = 'Soldier.bmp')]
		private const PLAYER:Class;
		private dead:Boolean;
		
		
		public function People() 
		{
			graphic = image;
			x = 0;
			y = 300;
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