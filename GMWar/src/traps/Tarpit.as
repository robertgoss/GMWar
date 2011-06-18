package traps
{
import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
    public class Tarpit extends Trap
    {
        [Embed(source = '../Asserts/tarpit.png')]
		private const PLAYER:Class;
		private var image:Image = new Image(PLAYER);
        public function Tarpit(x_:int)
        {
            super(x_)
			graphic = image;
            damage = new Damage("SLOW",1,1,0,this);
            price = 10;
            projectile = null;
            airbourne = false;
            tHeight = 0;
            tWidth = 40;
            scalibility = false;
            conApply = true;
        }
    }
}
