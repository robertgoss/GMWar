package traps 
{
	
	/////////////////////////Trap Number 6/////////////////////
    import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
    import net.flashpunk.graphics.Spritemap;
	import Effects.Gas;
    public class VemonHoverTurret extends Trap
    {
        [Embed(source = '../Asserts/Turret.png')]
		private const PLAYER:Class;
		private var image:Spritemap = new Spritemap(PLAYER,10,10);

        public static var price:int = 125;

        public function VemonHoverTurret(x_:int)
        {
            super(x_)
            image.y = -10;
            image.x = 0;
			graphic = image;
            damage = null;
            //price = 10;
            var pDam:Damage = new Damage("POISON",0,3,1,this);
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
			effects.push(new Gas(x-3, y-105));
			setHitbox (image.scaledWidth, -image.scaledHeight);
        }
    }
	
}
