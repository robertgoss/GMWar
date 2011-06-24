package traps 
{
	
	/////////////////////////Trap Number 6/////////////////////
    import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
    import net.flashpunk.graphics.Spritemap;
	import Effects.Cold;
    public class FreezingHoverTurret extends Trap
    {
        [Embed(source = '../Asserts/TurretA.png')]
		private const PLAYER:Class;
		private var image:Spritemap = new Spritemap(PLAYER,25,19);

        public static var price = 60;
        public function FreezingHoverTurret(x_:int)
        {
            super(x_)
            image.y = -19;
            image.x = -7;
			graphic = image;
            damage = null;
            //price = 10;
            var pDam:Damage = new Damage("ICE",10000,0,2,this);
            projectile = new Projectile(pDam,4,1,30,this);
            airbourne = true;
            tHeight = 0;
            tWidth = 10;
            scalibility = false;
            conApply = true;
            blocking = false;
            lRap = 6
            rRap = -5
			yTrue -= 100;
			effects.push(new Cold(x-3, y-105));
			setHitbox (image.scaledWidth, -image.scaledHeight);
			groundUtility = 30;
			airUtility = 0;
        }
    }
	
}
