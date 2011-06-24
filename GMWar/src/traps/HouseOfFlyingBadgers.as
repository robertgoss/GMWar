package traps 
{
	/////////////////////////Trap Number 16/////////////////////
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
		
        public static var price:int = 300;
		
		public function  HouseOfFlyingBadgers(x_:Number) 
		{
			image.y = -image.height;
			graphic = image;
			super(x_);
            damage = new Damage("NORMAL",1,8,3,this);
            //price = 10;
            projectile = null;
            airbourne = false;
            tHeight = 65;
            tWidth = 74;
            scalibility = true;
            conApply = true;
            blocking = false;
			effects.push(new Badger(x+image.width/2, y-image.height + 14));
			setHitbox (image.scaledWidth, -image.scaledHeight);
			layer = -1;
			// TEMP!!!
			tempType = "h";
		}
		
	}
	
}
