package Effects 
{
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP;
	/**
	 * ...
	 * @author Chris Jacobs
	 */
	public class Spike extends Effect
	{
		[Embed (source = '../Asserts/spikes.png')]
		private var IMAGE:Class;
		private var image:Image = new Image(IMAGE);
		private var frame:int;
		private var direction:int;
		
		public function Spike(xPos:Number, yPos:Number) 
		{
			graphic = image;
			FP.world.add(this);
			x = xPos;
			y = yPos;
			frame = 0;
			direction = -1;
		}
		
		override public function update():void 
		{
			if (frame == 61) direction = 1;
			else if (frame == 0) 
			{	
				direction = -1;
			}
			
			y += image.height / 60 * direction;
			
			frame++;
			if (frame == 122) frame = 0;
		}
		
	}
	
}