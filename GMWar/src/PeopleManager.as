package  
{
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author David
	 */
	public class PeopleManager 
	{
		
		public function PeopleManager() 
		{
			
		}
		
		public function update():void
		{
			if (FP.world.classCount(People) == 0)
			{				
				addWave();
			}
		}
		
		public function addWave():void
		{
			for (var i : int = 0; i < 10; i++)
			{
				FP.world.add(new People(FP.rand(11) - 10));
			}
		}
		
		public function removePeople():void
		{
			
		}

        public static function breed(xPos:int,yPos:int,p1:People,p2:People):People
        {
            return People(xPos,yPos);
        }
	}

}
