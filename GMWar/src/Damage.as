package  
{
    import net.flashpunk.Entity
    
	public class Damage
    {
        public var alive:Boolean;
        public var type:String;
        public var damage:int;
        public var dur:int;
        public var target:Entity;

        public function Damage(type_:String,dur_:int,damage_:int,target_:Entity)
        {
            alive = true;
            type = type_;
            dur = dur_;
            damage = damage_;
            target = target_;
        }

        public function update():int
        {
            dur = dur - 1;
            if(dur < 0)
            {
                alive = false;
            }
            if(type=="FIRE")
            {
                return 0;
            }
            if(type=="POISON")
            {
                return 0;
            }
            return damage;
        }
        
    }
}
