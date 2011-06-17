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
	}

}