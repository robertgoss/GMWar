package traps 
{
	import net.flashpunk.graphics.Image;
	
	/**
	 * ...
	 * @author Chris Jacobs
	 */
	public class  HouseOfFlyingBadgers extends Trap
	{
		private var image:Image;
		
		public function  HouseOfFlyingBadgers(x_:Number) 
		{
			graphic = image;
			super(x_);

            damage = new Damage("NORMAL",1,12,0,this);
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