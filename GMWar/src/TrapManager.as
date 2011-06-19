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

        public function addTrap(trap:Trap):Boolean
        {
            for each(var trapC:Trap in traps)
            {
                if(trap.xTrue<(trapC.xTrue+trapC.tWidth))
                {
                    if((trap.tWidth+trap.xTrue)>(trapC.xTrue-trapC.tWidth))
                    {
                        return false;
                    }
                }
            }
            FP.world.add(trap);
            traps.push(trap);
            return true;
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
        
        public function removeTrapAt(x:int,y:int)
        {
            for each(var trap:Trap in traps)
            {
                if(x>trap.xTrue && x<trap.xTrue+2*trap.tWidth)
                {
                    if(y<=(FP.world as Environment).floorHieght(x))
                    {
                        removeTrap(trap)
                        return true;
                    }
                }
            }           
            return false;
        }
    }

}
