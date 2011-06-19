package traps 
{
	import Effects.Gas;
	import net.flashpunk.graphics.Image;
	
	/**
	 * ...
	 * @author Chris Jacobs
	 */
	public class GasHouse extends Trap
	{
		[Embed (source = '../Asserts/House.png')]
		private static const IMAGE:Class;
		private var image:Image = new Image(IMAGE);
		
		public function GasHouse(x_:Number) 
		{
			image.y = -image.height;
			graphic = image;
			super(x_);

            damage = new Damage("GAS",1,8,5,this);
            price = 10;
            projectile = null;
            airbourne = false;
            tHeight = 40;
            tWidth = 40;
            scalibility = true;
            conApply = true;
            blocking = false;
			effects.push(new Gas(x + 12, y - 20));
			effects.push(new Gas(x+47, y-20));
			setHitbox (image.scaledWidth, -image.scaledHeight);
			layer = -1;
		}
		
	}
	
}