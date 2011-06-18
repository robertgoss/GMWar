package  
{
    import net.flashpunk.Entity;
    import net.flashpunk.FP;


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
        public var tHeight:int;
        public var tWidth:int;
        public var scalibility:Boolean;
        public var conApply:Boolean;

        public function Trap(x_:int)
        {
            x = x_;
            y = (FP.world as Environment).floorHieght(x);
        }
        
        public function isIn(xTest:int):Boolean
        {
            if(xTest>=(x-(tWidth/2)))
            {
                if(xTest<=(x+(tWidth/2)))
                {
                    return true;
                }
            }
            return false;
        }

        public override function update():void
        {
            super.update()
            if(projectile!=null)
            {
                projectile.update()
            }
        }

        public function onTrap(person:People):void
        {
            if(conApply && damage!=null)
            {
                if(FP.rand(damage.prob)==0)
                {
                    person.addDamage(damage);
                }
            }
        } 

        public function onTrapFirst(person:People):void
        {
            if(damage!=null)
            {
                if(FP.rand(damage.prob)==0)
                {
                    person.addDamage(damage);
                }
            }
        } 
    }
}   
