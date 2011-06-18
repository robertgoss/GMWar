package traps
{
import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
    public class Tarpit extends Trap
    {
        [Embed(source = '../Asserts/tarpitInv.png')]
		private const PLAYER:Class;
		private var image:Image = new Image(PLAYER);
		
        public function Tarpit(x_:int)
        {
			graphic = image;
			super(x_, "Fire");
            damage = new Damage("SLOW",1,25,0,this);
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
