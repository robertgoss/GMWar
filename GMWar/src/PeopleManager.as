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
				FP.world.add(randomPerson(FP.rand(151)-150));
			}
		}
		
		public function removeDeadPeople():void
		{
			var temp:Array = [];
			FP.world.getClass(People, temp);
			for each (var person:People in temp) 
			{
				if (person.IsDead())
				{
					FP.world.remove(person);
				}
			}
		}

        public function between(x1:int,x2:int):Array
        {
            var temp:Array = [];
            var between:Array = []
			FP.world.getClass(People, temp);
			for each (var person:People in temp) 
			{
                if(person.x >= x1)
                {
                    if(person.x <= x2)
                    {
                        between.push(person)
                    }
                }
            }
            return between;
        }

        public static function randomPerson(x:int):People
        {
            var seq:Array = []
            var s:int = 0;
            for(var i:int=0;i<8;i++)
            {
                seq[i] = FP.rand(11);
                s += seq[i]
            }   
            for(i=0;i<8;i++)
            {
                trace(i,seq[i]);
                seq[i] = seq[i] / s;
            }
            var person:People = new People(x)
            person.setSeq(seq);
            return person;
        }

        public static function breed(xPos:int,yPos:int,p1:People,p2:People):People
        {
            return new People(xPos,yPos);
        }
	}

}
