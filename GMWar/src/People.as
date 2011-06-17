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
			x = 0;
			y = 300;
			dead = false;
		}
		
		public Update()
		{
			x += 0.2;
		}
		
		public function IsDead():Boolean
		{
			return dead;
		}
		
	}
	
}