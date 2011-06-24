package traps
{
	/////////////////////////Trap Number 4/////////////////////
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
    import Effects.Gas;
	
    public class PoisonTrap extends Trap
    {
        [Embed(source = '../Asserts/pit.png')]
		private const PLAYER:Class;
		private var image:Image = new Image(PLAYER);

        public static var price:int = 150;
		
        public function PoisonTrap(x_:int)
        {
			graphic = image;
			super(x_);
			for (var i:int = 0; i < 8; i++)
			{
				effects.push(new Gas(rel_x(x-2 + i*10, y),rel_y(x-2 + i*10, y)))
			}
            damage = new Damage("Poison",1,5,3,this);
            //price = 10;
            projectile = null;
            airbourne = false;
            tHeight = 0;
            tWidth = 80;
            scalibility = false;
            conApply = true;
            blocking = false;
			groundUtility = 80;
			airUtility = 0;
			
			setHitbox (image.scaledWidth, image.scaledHeight);
        }
		
    }
}
