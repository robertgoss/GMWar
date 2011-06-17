package  
{
    import net.flashpunk.FP;
    import net.flashpunk.World;
	/**
	 * ...
	 * @author David
	 */
	public class TrapManager 
	{
        public var traps:Array;
		
		public function TrapManager() 
		{
			traps = new Array();
		}

        public function addTrap(trap:Trap):void
        {
            FP.world.add(trap);
            traps.push(trap);
        }

        public function removeTrap(trap:Trap):void
        { 
		    FP.world.remove(trap);
            getTraps();
	    }

        private function getTraps():void
        {
            traps = new Array();
            FP.world.getClass(Trap,traps);
        }

        public function update():void
        {
            getTraps();
        }

        public function trapAt(y:int):Trap
        {
            for each(var trap:Trap in traps)
            {
                if( trap.isIn(y) )
                {
                    return trap
                }
            }
            return null;
        }
    }

}
