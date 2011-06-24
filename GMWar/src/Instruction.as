package  
{
	import net.flashpunk.World;
	import net.flashpunk.graphics.Image
	/**
	 * ...
	 * @author Chris Jacobs
	 */
	public class Instruction extends World
	{
		[Embed (source = 'Asserts/Instruction.png')]
		private static const IMAGE:Class;
		private var image:Image = new Image(IMAGE);
		
		public function Instruction() 
		{
			addGraphic(image, 0);
		}
		
	}
	
}