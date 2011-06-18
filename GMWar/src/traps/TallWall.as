package traps
{
import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
    public class TallWall extends Trap
    {
        [Embed(source = '../Asserts/lWall.png')]
		private const PLAYER:Class;
		private var image:Image = new Image(PLAYER);
        public function Wall(x_:int)
        {
            super(x_)
            image.y = -150;
			graphic = image;
            damage = null;
            price = 10;
            projectile = null;
            airbourne = false;
            tHeight = 150;
            tWidth = 10;
            scalibility = false;
            conApply = true;
            blocking = true;
        }
    }
}
