package  
{
    import net.flashpunk.FP;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	
	/**
	 * ...
	 * @author Chris Jacobs
	 */
	public class Angel extends Entity
	{
		
		[Embed (source = 'Asserts/angel.png')]
		private static const IMAGE:Class
		private var image:Image = new Image(IMAGE);
		
		public function Angel(xPos:Number, yPos:Number) 
		{
			image.scale = 0.5;
			image.alpha = 0.5;
			graphic = image;
			x = xPos;
			y = yPos;
			FP.world.add(this);
		}
		
		override public function update():void 
		{
			y -= 0.5;
			image.alpha -= 0.002;
			if (y < 0) FP.world.remove(this);
		}
		
	}
	
}