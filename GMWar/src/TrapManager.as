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
            if((FP.world as Environment).money-trap.getClass().price<0)
            {
                trap.clean();
                return true;
            } 
            (FP.world as Environment).money -= trap.getClass().price;
            if(!trap.airbourne)
            {
				for each(var trapC:Trap in traps)
				{
					if(!trapC.airbourne)
					{
					if(trap.xTrue<(trapC.xTrue+2*trapC.tWidth))
					{
						if((2*trap.tWidth+trap.xTrue)>trapC.xTrue)
						{
							trap.clean();
							removeTrap (trap);
							return false;
						}
					}
					}
				}
            }
			// TEMP!!!
			if ( trap.tempType == "h" )
			{
				trace ("h");
			}
            FP.world.add(trap);
            traps.push(trap);
            return true;
        }
        

        public function removeTrap(trap:Trap):void
        { 
            (FP.world as Environment).money += trap.getClass().price
            trap.clean();
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

        public function los(x1,y1,x2,y2):Boolean
        {
            if(x1>x2)
            {
                var t:int = x2
                x2 = x1
                x1 = t
                t = y2
                y2 = y1
                y1 = t
            }
            for each(var trap:Trap in traps)
            {
                if(trap.xTrue<x2)
                {
                    if(trap.xTrue+2*trap.tWidth>x1)
                    {
                        return false;
                    }
                }
            }
            return true;
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
