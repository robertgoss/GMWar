package traps 
{
	import Effects.Fire;
	import net.flashpunk.graphics.Image;
	
	/**
	 * ...
	 * @author Chris Jacobs
	 */
	public class BurningHouse extends Trap
	{
		[Embed (source = '../Asserts/House.png')]
		private static const IMAGE:Class;
		private var image:Image = new Image(IMAGE);
		
		public function BurningHouse(x_:Number) 
		{
			image.y = -image.height;
			graphic = image;
			super(x_);
            damage = new Damage("FIRE",1,8,5,this);
            price = 10;
            projectile = null;
            airbourne = false;
            tHeight = 40;
            tWidth = 40;
            scalibility = true;
            conApply = true;
            blocking = false;
			effects.push(new Fire(x + 12, y - 20));
			effects.push(new Fire(x+47, y-20));
			setHitbox (image.scaledWidth, -image.scaledHeight);
			layer = -1;
		}
		
	}
	
}