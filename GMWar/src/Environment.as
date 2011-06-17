package  
{
	import net.flashpunk.World;
	
	/**
	 * ...
	 * @author David
	 */
	public class Environment extends World 
	{
		public var trapMgr:TrapManager;
        public var peopleMgr:PeopleManager;

		public function Environment() 
		{
			peopleMgr = new PeopleManager();
            trapMgr = new TrapManager(); 
		}

        public override function update():void
        {
            super.update()
            peopleMgr.update()
            trapMgr.update()
        }

        public floorHieght(x:int):int
        {
            return 200;
        }
		
	}

}
