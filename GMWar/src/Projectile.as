package  
{
    import net.flashpunk.FP;
    import net.flashpunk.Entity;
    import net.flashpunk.utils.Draw;

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
        public var parent:Trap;
        public var clock:int;
        public var cTargets:Array;

        public function Projectile(damage_:Damage,coolOff_:int,numFire_:int,range_:int,parent_:Trap)
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
            if(clock < 0)
            {
                fire();
                clock = coolOff;
            }
        }

        public function fire():void
        {
            cTargets = []
            var targets:Array = (FP.world as Environment).peopleMgr.between(parent.xTrue-range,parent.xTrue+range)
            if(targets.length == 0)
            {
                return;
            }
            for(var i:int=0;i<(numFire+1);i++)
            {
                var target:People = targets[FP.rand(targets.length)] as People
                if(target)
                {
                    target.addDamage(damage);
                    var point:Array = []
                    point[0] = target.xTrue+20
                    point[1] = target.yTrue-30
                    if((FP.world as Environment).trapMgr.los(parent.xTrue,parent.yTrue-parent.tHeight,point[0],point[1]))
                    {
                        cTargets.push(point)
                    }
                }
            }
        }

        public function render():void
        {
            for each(var target:Array in cTargets)
            {
                if(parent.xTrue<800)
                {
                    Draw.line(parent.xTrue,parent.yTrue-parent.tHeight,target[0]-20,target[1]-30)
                }else
                {
                    Draw.line(parent.xTrue-800,parent.yTrue-parent.tHeight-350,target[0]-800-20,target[1]+350-30)
                }
            }
        }
    }
}
