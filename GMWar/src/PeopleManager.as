package  
{
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author David
	 */
	public class PeopleManager 
	{
        private var breedingPool:Array;
        private var currentPool:Array;

        private var reload:int;
        		
		public function PeopleManager() 
		{
			breedingPool = [];
            for(var i:int=0;i<14;i++)
            {
                breedingPool.push(randomSeq());
            }
            currentPool = [];
            reload = 0;
		}
		
		public function update():void
		{
            reload -= 1
			if (reload<0 && FP.world.classCount(People) < 20)
			{	
                reload = 1000;			
				addWave();
			}
			removeDeadPeople();
            updatePool();
		}

      
		public function addWave():void
		{
			for (var i : int = 0; i < 10; i++)
			{
				FP.world.add(breed(FP.rand(151)-150));
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
                    var record:Array = []
                    record[0] = person.xTrue;
                    record[1] = person.getSeq();
                    currentPool.push(record)
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
                if(person.xTrue >= x1)
                {
                    if(person.xTrue <= x2)
                    {
                        between.push(person)
                    }
                }
            }
            return between;
        }

        public static function randomSeq():Array
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
                //trace(i,seq[i]);
                seq[i] = 32 * seq[i] / s;
            }
            return seq;
        }

        public static function randomPerson(x:int):People
        {
            var seq:Array = randomSeq();
            var person:People = new People(x)
            person.setSeq(seq);
            return person;
        }
        
        public function updatePool():void
        {
            var top:Array = [-1];
            var second:Array = [-2];
            var third:Array = [-3];
            if(currentPool.length>9)
            {
                for each(var record:Array in currentPool)
                {
                    if(record[0] > top[0])
                    {
                        third = second;
                        second = top;
                        top = record;
                    }else
                    {
                        if(record[0] > second[0])
                        {
                            third = second;
                            second = record
                        }else
                        {
                            if(record[0]>third[0])
                            {
                                third = record;
                            }
                        }
                    }
                }
				breedingPool = breedingPool.reverse();
				breedingPool.pop();
				breedingPool.pop();
				breedingPool.pop();
				breedingPool = breedingPool.reverse();
				breedingPool.push(top[1]);
				breedingPool.push(second[1]);
				breedingPool.push(third[1]);
				currentPool = [];
            }
        }

        public function breed(xPos:int):People
        {
            if(FP.rand(20)==0)
            {
                return randomPerson(xPos);
            }
            var male:Array = breedingPool[FP.rand(14)];
            var female:Array = breedingPool[FP.rand(14)];
            var seq:Array = []
            seq[0] = male[0]
            seq[1] = male[1]
            seq[2] = male[2]
            seq[3] = male[3]
            seq[4] = female[4]
            seq[5] = female[5]
            seq[6] = female[6]
            seq[7] = female[7]
            var mut:int = FP.rand(8)
            seq[mut] = FP.rand(5)-2
            if(seq[mut]<0)
            {
                seq[mut] = 0
            }
            if(seq[mut]>10)
            {
                seq[mut] = 10
            }
            var s:int = 0;
            for(var i:int=0;i<8;i++)
            {
                s += seq[i]
            }
            for(i=0;i<8;i++)
            {
                seq[i] = seq[i] * 32 / s
                if(seq[i]<0)
                {
                    seq[i] = 0
                }
                if(seq[i]>15)
                {
                    seq[i] = 15
                }
            }
            
            var person:People = new People();
            person.setSeq(seq)
            return person;
        }
	}

}
