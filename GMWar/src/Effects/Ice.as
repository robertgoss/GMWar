package Effects 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Ease;
	import net.flashpunk.graphics.Emitter;
	import net.flashpunk.FP;
	/**
	 * ...
	 * @author Chris Jacobs
	 */
	public class Ice extends Effect
	{
		
		[Embed(source = '../Asserts/ice.png')]
		private const ICE:Class;
		private var iceImage:Image = new Image(ICE);
		
		//I'm bored
		
		
		public function Ice(xPos:Number, yPos:Number) 
		{
			iceImage.scale = 0.5;
			graphic = iceImage;
			x = xPos;
			y = yPos - iceImage.height*iceImage.scale;
			FP.world.add(this);
		}
		
	}
	
}