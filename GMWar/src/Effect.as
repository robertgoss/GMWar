package  
{
	import flash.display.BitmapData;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Emitter;
	import net.flashpunk.utils.Ease;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Draw;
	import net.flashpunk.FP;
	/**
	 * ...
	 * @author Chris Jacobs
	 */
	
	 //Draws lines
	public class Effect extends Entity
	{
		private var emitter:Emitter;
		//private const partile_number:uint = 100;
		
		[Embed(source = 'Asserts/fire.png')]
		private const FIRE:Class;
		private var fireImage:Image = new Image(FIRE);
		private var delay:int = 0;
		
		public function Effect(xPos:Number = 0, yPos:Number = 0, type:String = "Fire" )
		{
			emitter = new Emitter(new BitmapData(1, 1), 1, 1);
			emitter.newType("Fire", [0]);
			emitter.setAlpha("Fire", 1.0);
			emitter.setMotion("Fire", 90, 20, 3, 0, 0, -0.5, Ease.quadOut);
			emitter.setColor("Fire", 0xFF4600);
			graphic = new Graphiclist(fireImage, emitter);
			x = xPos;
			y = yPos - fireImage.height;
			width = fireImage.width;
			
			FP.world.add(this);
		}
		
		override public function update():void 
		{
			if (delay == 0)
			{
				emitter.emit("Fire", Math.random() * halfWidth, 0);
				delay = 30;
			}
			else 
			{
				delay--;
			}
		}
	}
	
}