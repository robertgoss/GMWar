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
        }

        public function removeTrap(trap:Trap):void
        { 
		    FP.world.remove(trap);
	    }

        public function update():void
        {
            traps = new Array();
            FP.world.getClass(Trap,traps);
        }

        public function trapAt(y:int):Trap
        {
            return new Trap();
        }
    }

}
