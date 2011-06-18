package traps
{
import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
    public class Wall extends Trap
    {
        [Embed(source = '../Asserts/wallInv.png')]
		private const PLAYER:Class;
		private var image:Image = new Image(PLAYER);
        public function Wall(x_:int)
        {
            super(x_)
            image.scale = 0.5;
            image.y = -75;
			graphic = image;
            damage = null;
            price = 10;
            projectile = null;
            airbourne = false;
            tHeight = 63;
            tWidth = 10;
            scalibility = false;
            conApply = true;
            blocking = true;
        }
    }
}
