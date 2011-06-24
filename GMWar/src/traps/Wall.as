package traps
{
	/////////////////////////Trap Number 0/////////////////////
    import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
    public class Wall extends Trap
    {
        [Embed(source = '../Asserts/sWall.png')]
		private const PLAYER:Class;
		private var image:Image = new Image(PLAYER);

        public static var price:int = 35;
        public function Wall(x_:int)
        {
            super(x_)
            image.y = -120;
			graphic = image;
            damage = null;
            //price = 10;
            projectile = null;
            airbourne = false;
            tHeight = 112;
            tWidth = 10;
            scalibility = false;
            conApply = true;
            blocking = true;
            lRap = 6
            rRap = -5
			groundUtility = 50;
			airUtility = 0;
			
			setHitbox (image.scaledWidth, -image.scaledHeight);
        }
    }
}
