package Effects 
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Ease;
	import net.flashpunk.graphics.Emitter;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author Chris Jacobs
	 */
	public class Gas extends Effect
	{
		private var emitter:Emitter;
		
		public function Gas(xPos:Number = 0, yPos:Number = 0) 
		{
			emitter = new Emitter(new BitmapData(1, 1), 1, 1);
			emitter.newType("Gas", [0]);
			emitter.setAlpha("Gas", 1.0);
			emitter.setMotion("Gas", 100, 50, 3, -20, 0, -0.5);
			emitter.setColor("Gas", 0x00FF00);
			graphic = emitter;
			FP.world.add(this);
			x = xPos;
			y = yPos;
		}
		
		override public function update():void 
		{
				emitter.emit("Gas", 0, 0);
		}
		
	}
	
}