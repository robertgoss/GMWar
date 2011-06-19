package traps 
{
	/////////////////////////Trap Number 2/////////////////////
	import Effects.Spike;
	import net.flashpunk.graphics.Image;
	
	/**
	 * ...
	 * @author Chris Jacobs
	 */8
	public class SpikePit extends Trap
	{
		[Embed (source = '../Asserts/pit.png')]
		private static const IMAGE:Class;
		private var image:Image = new Image(IMAGE);
    
        public static var price:int = 150;
		
		public function SpikePit(x_:Number) 
		{
			graphic = image;
			super(x_);

            damage = new Damage("NORMAL",1,12,4,this);
            //price = 10;
            projectile = null;
            airbourne = false;
            tHeight = 0;
            tWidth = 40;
            scalibility = false;
            conApply = true;
            blocking = false;
			effects.push(new Spike(rel_x(x, y), rel_y(x, y)));
			setHitbox (image.scaledWidth, image.scaledHeight);
		}
		
	}
	
}
