package  
{
    import net.flashpunk.Entity;

	/**
	 * ...
	 * @author David
	 */
	public class Trap extends Entity
	{
        public var price:int;
        public var damage:Damage;
        public var projectile:Projectile;
        public var airbourne:Boolean;
        public var hieght:int;
        public var scalibility:int;
        public var tWidth:int;

        public function Trap()
        {
            
        }
        
        public function isIn(xTest:int):Boolean
        {
            if(xTest>=(x-width/2))
            {
                if(xTest<=(x+width/2))
                {
                    return true;
                }
            }
            return false;
        } 
    }
}   
