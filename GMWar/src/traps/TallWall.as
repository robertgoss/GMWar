package traps
{
	/////////////////////////Trap Number 1/////////////////////
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
    public class TallWall extends Trap
    {
        [Embed(source = '../Asserts/lWall.png')]
		private const PLAYER:Class;
		private var image:Image = new Image(PLAYER);

        public static var price:int = 50;
        public function TallWall(x_:int)
        {
            super(x_)
            image.y = -150;
			graphic = image;
            damage = null;
            //price = 10;
            projectile = null;
            airbourne = false;
            tHeight = 148;
            tWidth = 10;
            scalibility = false;
            conApply = true;
            blocking = true;
            lRap = 6
            rRap = -5
			groundUtility = 80;
			airUtility = 0;
			
			setHitbox (image.scaledWidth,-image.scaledHeight);
        }
    }
}
