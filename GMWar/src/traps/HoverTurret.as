package traps 
{
	
	/////////////////////////Trap Number 6/////////////////////
    import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
    import net.flashpunk.graphics.Spritemap;
    public class HoverTurret extends Trap
    {
        [Embed(source = '../Asserts/TurretA.png')]
		private const PLAYER:Class;
		private var image:Spritemap = new Spritemap(PLAYER,25,19);

        public static var price:int = 75;
        public function HoverTurret(x_:int)
        {
            super(x_)
            image.y = -19;
            image.x = -7;
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
			yTrue -= 100;
			setHitbox (image.scaledWidth, -image.scaledHeight);
			groundUtility = 60;
			airUtility = 60;
        }
    }
	
}
