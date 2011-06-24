package traps 
{
	
	/////////////////////////Trap Number 9/////////////////////
    import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
    import net.flashpunk.graphics.Spritemap;
    public class LargeTurret extends Trap
    {
        [Embed(source = '../Asserts/TurretB.png')]
		private const PLAYER:Class;
		private var image:Spritemap = new Spritemap(PLAYER,20,10);
    
        public static var price:int = 100;        

        public function LargeTurret(x_:int)
        {
            super(x_)
            image.y = -19;
            image.x = -5;
			image.scale = 2.0;
			graphic = image;
            damage = null;
            //price = 10;
            var pDam:Damage = new Damage("Normal",0,500,1,this);
            projectile = new Projectile(pDam,160,1,30,this);
            airbourne = false;
            tHeight = 0;
            tWidth = 10;
            scalibility = false;
            conApply = true;
            blocking = false;
            lRap = 6
            rRap = -5
			
			setHitbox (image.scaledWidth, -image.scaledHeight);
        }
    }
	
}
