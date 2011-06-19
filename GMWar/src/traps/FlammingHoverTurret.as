package traps 
{
	
	/////////////////////////Trap Number 6/////////////////////
	import Effects.Fire;
    import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
    import net.flashpunk.graphics.Spritemap;
    public class FlammingHoverTurret extends Trap
    {
        [Embed(source = '../Asserts/Turret.png')]
		private const PLAYER:Class;
		private var image:Spritemap = new Spritemap(PLAYER,10,10);
        public function FlammingHoverTurret(x_:int)
        {
            super(x_)
            image.y = -10;
            image.x = 0;
			graphic = image;
            damage = null;
            price = 10;
            var pDam:Damage = new Damage("FIRE",0,12,5,this);
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
			effects.push(new Fire(x-3, y-105));
			setHitbox (image.scaledWidth, -image.scaledHeight);
        }
    }
	
}