package traps 
{
	
	/////////////////////////Trap Number 7/////////////////////
	import Effects.Fire;
    import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
    import net.flashpunk.graphics.Spritemap;
	
    public class FlammingTurret extends Trap
    {
        [Embed(source = '../Asserts/Turret.png')]
		private const PLAYER:Class;
		private var image:Spritemap = new Spritemap(PLAYER,10,10);
        public function FlammingTurret(x_:int)
        {
            super(x_)
            image.y = -10;
            image.x = 0;
			graphic = image;
            damage = null;
            price = 10;
            var pDam:Damage = new Damage("FIRE",0,12,5,this);5
            projectile = new Projectile(pDam,4,1,30,this);
            airbourne = false;
            tHeight = 0;
            tWidth = 10;
            scalibility = false;
            conApply = true;
            blocking = false;
            lRap = 6
            rRap = -5
			effects.push(new Fire(x-7, y-5));
			setHitbox (image.scaledWidth, -image.scaledHeight);
        }
    }
	
}