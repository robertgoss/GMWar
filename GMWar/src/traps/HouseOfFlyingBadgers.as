package traps 
{
	import Effects.Badger;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.graphics.Image;
	
	/**
	 * ...
	 * @author Chris Jacobs
	 */
	public class  HouseOfFlyingBadgers extends Trap
	{
		[Embed (source = '../Asserts/House.png')]
		private static const IMAGE:Class;
		private var image:Image = new Image(IMAGE);
		
		
		public function  HouseOfFlyingBadgers(x_:Number) 
		{
			image.y = -image.height;
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
			effects.push(new Badger(x+image.width/2, y-image.height + 14));
			setHitbox (image.scaledWidth, -image.scaledHeight);
			layer = -1;
		}
		
	}
	
}