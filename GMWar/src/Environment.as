package  
{
	import net.flashpunk.World;
    import traps.Tarpit;
	
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
            //Add Floor
		}

        public override function begin():void
        {
            super.begin()
            trapMgr.addTrap(new Tarpit(200));
        }

        public override function update():void
        {
            super.update()
            peopleMgr.update()
            trapMgr.update()
        }

        public function floorHieght(x:int):int
        {
            return 200;
        }
		
	}

}
