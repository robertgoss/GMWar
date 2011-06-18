package  
{
	import net.flashpunk.World;
    import net.flashpunk.utils.Draw;
    import traps.Tarpit;
    import traps.Wall;
    import traps.TallWall;
	
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
            //trapMgr.addTrap(new Tarpit(200));
            //trapMgr.addTrap(new Wall(350));
            trapMgr.addTrap(new TallWall(410));
        }

        public override function update():void
        {
            super.update()
            peopleMgr.update()
            trapMgr.update()
        }

        public override function render():void
        {
            super.render()
            Draw.line(0,floorHieght(0),800,floorHieght(800),0xFFFFFF)
            //Draw.line(200,floorHieght(0),200,0,0xFFFFFF)
            //Draw.line(350,floorHieght(0),350,0,0xFFFFFF)
        }

        public function floorHieght(x:int):int
        {
            return 200;
        }
		
	}

}
