package traps
{
	/////////////////////////Trap Number 6/////////////////////
    import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
    import net.flashpunk.graphics.Spritemap;
    public class Turret extends Trap
    {
        [Embed(source = '../Asserts/Turret.png')]
		private const PLAYER:Class;
		private var image:Spritemap = new Spritemap(PLAYER,10,10);


        public static var price:int = 60;
        public function Turret(x_:int)
        {
            super(x_)
            image.y = -10;
            image.x = 0;
			graphic = image;
            damage = null;
            //price = 10;
            var pDam:Damage = new Damage("Normal",0,3,1,this);
            projectile = new Projectile(pDam,4,1,30,this);
            airbourne = false;
            tHeight = 0;
            tWidth = 10;
            scalibility = false;
            conApply = true;
            blocking = false;
            lRap = 6
            rRap = -5
			
			setHitbox (image.scaledWidth, -image.scaledHeight);
			groundUtility = 60;
			airUtility = 50;
        }
    }
}
