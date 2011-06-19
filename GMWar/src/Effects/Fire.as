package  Effects
{
	import flash.display.BitmapData;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Emitter;
	import net.flashpunk.utils.Ease;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Draw;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Spritemap;
	/**
	* ...
	* @author Chris Jacobs
	*/
	
	//Draws lines
	public class Fire extends Effect
	{
		//private var emitter:Emitter;
		//private const partile_number:uint = 100;
		
		[Embed(source = '../Asserts/fire.png')]
		private static const FIRE:Class;
		private var fireImage:Spritemap = new Spritemap(FIRE, 15, 30);
		
		private var delay:int = 0;
		
		public function Fire(xPos:Number = 0, yPos:Number = 0)
		{	
			fireImage.add("Flames", [0, 1, 2], 10, true);
			graphic = fireImage;
				
			x = xPos;
			y = yPos - fireImage.height;
			width = fireImage.width;
			layer = -1;
			
			FP.world.add(this);
			fireImage.play("Flames");
		}
		
		override public function update():void 
		{
		
		}
	}
	
}
