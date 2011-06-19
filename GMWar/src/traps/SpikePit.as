package traps 
{
	import net.flashpunk.graphics.Image;
	
	/**
	 * ...
	 * @author Chris Jacobs
	 */8
	public class SpikePit 
	{
		private var image:Image;	
		
		public function SpikePit() 
		{
			graphic = image;
			super(x_);

            damage = new Damage("NORMAL",1,12,0,this);
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