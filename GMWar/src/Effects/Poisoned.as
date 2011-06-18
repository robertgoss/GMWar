package Effects 
{
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author Chris Jacobs
	 */
	public class Poisoned extends Effect
	{
		[Embed (source = '../Asserts/poison.png')]
		private static const IMAGE:Class
		private var image:Image = new Image(IMAGE);
		private var p:People;
		
		public function Poisoned(xPos:Number,yPos:Number, person:People) 
		{
			graphic = image;
			x = xPos;
			y = yPos;
			p = person;
		}
		
		override public function update():void 
		{
			x = p.x;
			y = p.y;
		}
		
	}
	
}