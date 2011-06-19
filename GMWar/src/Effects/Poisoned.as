package Effects 
{
	import net.flashpunk.graphics.Stamp;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author Chris Jacobs
	 */
	public class Poisoned extends Effect
	{
		private var p:People;
		
		public function Poisoned(xPos:Number,yPos:Number, person:People) 
		{
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
