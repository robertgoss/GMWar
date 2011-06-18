package traps
{
import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
    public class FirePit extends Trap
    {
        [Embed(source = '../Asserts/spikePit.png')]
		private const PLAYER:Class;
		private var image:Image = new Image(PLAYER);
		
        public function FirePit(x_:int)
        {
			graphic = image;
			super(x_, "Fire");
            damage = new Damage("FIRE",1,8,0,this);
            price = 10;
            projectile = null;
            airbourne = false;
            tHeight = 0;
            tWidth = 40;
            scalibility = false;
            conApply = true;
            blocking = false;
        }
		
    }
}
