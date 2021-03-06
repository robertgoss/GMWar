package traps 
{
	/////////////////////////Trap Number 18/////////////////////
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

        public static var price:int = 200;
		
		public function GasHouse(x_:Number) 
		{
			image.y = -image.height;
			image.x = -3;
			graphic = image;
			super(x_);

            damage = new Damage("GAS",1,12,3,this);
            //price = 10;
            projectile = null;
            airbourne = false;
            tHeight = 65;
            tWidth = 74;
            scalibility = true;
            conApply = true;
            blocking = false;
			effects.push(new Gas(x + 12, y - 20));
			effects.push(new Gas(x+47, y-20));
			setHitbox (image.scaledWidth, -image.scaledHeight);
			layer = -1;
			groundUtility = 120;
			airUtility = 0;
		}
		
	}
	
}
