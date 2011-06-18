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
        public var prob:int;

        public function Damage(type_:String,dur_:int,damage_:int,prob_:int,target_:Entity)
        {
            alive = true;
            type = type_;
            dur = dur_;
            damage = damage_;
            target = target_;
            prob = prob_
        }

        public function slows():Number
        {
            if(type=="SLOW")
            {
                return 0.15
            }
            if(type=="ICE")
            {
                return 0;
            }
            return 1;
        }

        public function isFire():Boolean
        {
            if(type=="FIRE")
            {
                return true;
            }
            return false;
        }

        public function isIce():Boolean
        {
            if(type=="ICE")
            {
                return true;
            }
            return false;
        }

        public function isPoison():Boolean
        {
            if(type=="POISON")
            {
                return true;
            }
            return false;
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
