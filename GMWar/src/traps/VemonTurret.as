package traps 
{
	
	/////////////////////////Trap Number 8/////////////////////
	import Effects.Cold;
	import Effects.Gas;
    import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
    import net.flashpunk.graphics.Spritemap;
	
    public class VemonTurret extends Trap
    {
        [Embed(source = '../Asserts/Turret.png')]
		private const PLAYER:Class;
		private var image:Spritemap = new Spritemap(PLAYER,10,10);
        public function VemonTurret(x_:int)
        {
            super(x_)
            image.y = -10;
            image.x = 0;
			graphic = image;
            damage = null;
            price = 10;
            var pDam:Damage = new Damage("POISON",0,12,1,this);
            projectile = new Projectile(pDam,4,1,30,this);
            airbourne = false;
            tHeight = 0;
            tWidth = 10;
            scalibility = false;
            conApply = true;
            blocking = false;
            lRap = 6
            rRap = -5
			effects.push(new Gas(x-3, y-5));
			setHitbox (image.scaledWidth, -image.scaledHeight);
        }
    }
	
}