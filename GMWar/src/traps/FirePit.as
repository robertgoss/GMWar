package traps
{
	/////////////////////////Trap Number 3/////////////////////
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
    import Effects.Fire;
    public class FirePit extends Trap
    {
        [Embed(source = '../Asserts/pit.png')]
		private const PLAYER:Class;
		private var image:Image = new Image(PLAYER);
		
        public function FirePit(x_:int)
        {
			graphic = image;
			super(x_);
			for (var i:int = 0; i < 8; i++)
			{
				effects.push(new Fire(rel_x(x-2 + i*10, y),rel_y(x-2 + i*10, y)))
			}

            damage = new Damage("FIRE",1,8,2,this);
            price = 10;
            projectile = null;
            airbourne = false;
            tHeight = 0;
            tWidth = 40;
            scalibility = false;
            conApply = true;
            blocking = false;
			
			setHitbox (image.scaledWidth, image.scaledHeight);
        }
		
    }
}
