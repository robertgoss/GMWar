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
        public var blocking:Boolean;
		public var effect:Effect;
        public var lRap:int;
        public var rRap:int;
		public var effects:Array;

        public var xTrue:int;
        public var yTrue:int;

        public function Trap(x_:int)
        {
            xTrue = x_;
            yTrue = (FP.world as Environment).floorHieght(x);       
            lRap = 0;
            rRap = 0;
			effects = new Array();

            x = xTrue;
            y = yTrue;

            if(xTrue>800)
            {
                x = xTrue - 800;
                y = yTrue + (FP.world as Environment).yDiff;
            }
        }

        public function rel_x(x:int,y:int):int
        {
            if(x>800)
            {
                return x - 800
            }else
            {
                return x
            }
        }

        public function rel_y(x:int,y:int):int
        {
            if(x>800)
            {
                return y + (FP.world as Environment).yDiff
            }else
            {
                return y
            }
        }
        

        public override function render():void
        {
            if(xTrue>750)
            {
                x = xTrue - 800;
                y = yTrue + (FP.world as Environment).yDiff;
                super.render()
            }
            if(xTrue<850)
            {
                x = xTrue
                y = yTrue
                super.render()
            }
        }
        
        public function isIn(xTest:int):Boolean
        {
            if(xTest>=xTrue)
            {
                if(xTest<=(xTrue+tWidth-rRap))
                {
                    return true;
                }
            }
            return false;
        }

        public override function update():void
        {
            if((FP.world as Environment).paused)
            {
                
            }
            super.update()
            if(projectile!=null)
            {
                projectile.update()
            }
			
			for each (var e:Effect in effects)
			{
				e.update();
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
