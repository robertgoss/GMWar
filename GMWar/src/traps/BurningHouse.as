package traps 
{
	import net.flashpunk.graphics.Image;
	
	/**
	 * ...
	 * @author Chris Jacobs
	 */
	public class BurningHouse 
	{
		private var image:Image;
		
		public function BurningHouse() 
		{
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
			
			setHitbox (image.scaledWidth, -image.scaledHeight);
		}
		
	}
	
}