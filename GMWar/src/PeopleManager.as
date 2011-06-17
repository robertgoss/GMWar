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
			removeDeadPeople();
		}
		
		public function addWave():void
		{
			for (var i : int = 0; i < 10; i++)
			{
				FP.world.add(new People(FP.rand(11) - 10));
			}
		}
		
		public function removeDeadPeople():void
		{
			var temp:People;
			FP.world.getClass(People, temp);
			for each (var person in temp) 
			{
				if (person.IsDead)
				{
					FP.world.remove(person);
				}
			}
		}
	}

}