package Effects 
{
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.utils.Ease;
	import net.flashpunk.graphics.Emitter;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author Chris Jacobs
	 */
	public class Cold extends Effect
	{
		[Embed (source = '../Asserts/cold.png')]
		private var IMAGE:Class;
		private var image:Spritemap = new Spritemap(IMAGE,15,30);
		
		public function Cold(xPos:Number = 0, yPos:Number = 0) 
		{
			image.add("Cold", [0, 1, 2], 10, true);
			graphic = image;
			FP.world.add(this);
			x = xPos;
			y = yPos-image.height;
            image.play("Cold");
			layer = -1;
		}
	}
	
}