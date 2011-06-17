package  
{
    import net.flashpunk.FP;
    import net.flashpunk.Entity;

	/**
	 * ...
	 * @author David
	 */
	public class Projectile
	{
        public var damage:Damage;
        public var coolOff:int;
        public var numFire:int;
        public var range:int;
        public var parent:Entity;
        public var clock:int;

        public function Projectile(damage_:Damage,coolOff_:int,numFire_:int,range_:int,parent_:Entity)
        {
            damage = damage_;
            coolOff = coolOff_;
            numFire_ = numFire;
            range = range_;
            parent_ = parent;
            clock = coolOff;
        }

        public function update():void
        {
            clock = clock - 1;
            if(clock == 0)
            {
                fire();
            }
        }

        public function fire():void
        {
            var targets:Array = (FP.world as Environment).peopleMgr.between(parent.x-range,parent.x+range)
            if(targets.length == 0)
            {
                return;
            }
            for(var i:int=0;i<numFire;i++)
            {
                var target:People = targets[FP.rand(targets.length)] as People
                target.addDamage(damage);
            }
        }
    }
}
