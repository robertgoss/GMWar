package Effects 
{
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP;
	/**
	 * ...
	 * @author Chris Jacobs
	 */
	public class Badger extends Effect
	{
		[Embed (source = '../Asserts/badger.png')]
		private static const IMAGE:Class;
		private var image:Image = new Image(IMAGE);
		
		public function Badger(xPos:Number, yPos:Number) 
		{
			image.x -= image.width/2;
			image.y -= image.height/2;
			graphic = image;
			FP.world.add(this);
			x = xPos;
			y = yPos;
			layer = -2;
		}
		
	}
	
}