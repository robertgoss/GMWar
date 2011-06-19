package UiClasses
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import flash.events.MouseEvent;
	import net.flashpunk.graphics.Text;

	/**
	 * ...
	 * @author David
	 */
	public class UI
	{		
		public static var currentFocus:int = -1;
		public static var roledOver:int = -1;
		
		private var scrolling:int = 0;
		private var buttons:Array;
		private var t:Number = 0;
		private var arrayPosition:int;
		
		public function UI() 
		{
			// Add buttons to screen //////////////////////////////////////////////
			FP.world.add(new Scroll(0, true, scrollL));
			FP.world.add(new Scroll(762, false, scrollR));
			buttons = [];
			arrayPosition = 0;
			for (var i:int = 0; i < 6; i++)
			{
				if (i < 4)
				{
					buttons.push(new Button(38 + 91 + 155 * i));
					FP.world.add(buttons[i] as Button);
				}
				else 
				{
					buttons.push(new Button(800));
					FP.world.add(buttons[i] as Button);
				}
			}
		}
		
		public function scrollL():void
		{
			if (buttons.length > 4)
			{
				scrolling--;
			}
		}
		
		public function scrollR():void
		{
			if (buttons.length > 4)
			{
				scrolling++;
			}
		}
		
		public function update():void
		{
			if (scrolling < 0)
			{
				t -= 1 / 60.0;
				
				if (t <= -1)
				{
					(buttons[arrayPosition] as Button).x = 800;
					arrayPosition = (arrayPosition + 1) % buttons.length;
					
					for (var i:int = 0; i < 4; i++)
					{
						(buttons[(arrayPosition + i) % buttons.length] as Button).x = 38 + 91 + 155 * i;
					}
					
					scrolling++;
					t = 0;
				}
				else
				{
					(buttons[arrayPosition] as Button).x = 129 - 190 * (1 - Math.cos(Math.PI * t))/2.0;
					
					for (var i:int = 1; i < 4; i++)
					{
						(buttons[(arrayPosition + i) % buttons.length] as Button).x = 38 + 91 + 155 * i - 155 * (1 - Math.cos(Math.PI * t))/2.0;
					}
					
					(buttons[(arrayPosition + 4) % buttons.length] as Button).x = 784 - 190 * (1 - Math.cos(Math.PI * t))/2.0;
				}				
			}
			else if (scrolling > 0)
			{				
				t += 1 / 60.0;
				
				if (t >= 1)
				{
					(buttons[arrayPosition] as Button).x = 800;
					arrayPosition = (arrayPosition - 1 + buttons.length) % buttons.length;
					
					for (var i:int = 0; i < 4; i++)
					{
						(buttons[(arrayPosition + i) % buttons.length] as Button).x = 38 + 91 + 155 * i;
					}
					
					scrolling--;
					t = 0;
				}
				else
				{
					(buttons[(arrayPosition - 1 + buttons.length) % buttons.length] as Button).x = -61 + 190 * (1 - Math.cos(Math.PI * t))/2.0;
					
					for (var i:int = 0; i < 3; i++)
					{
						(buttons[(arrayPosition + i) % buttons.length] as Button).x = 38 + 91 + 155 * i + 155 * (1 - Math.cos(Math.PI * t))/2.0;
					}
					
					(buttons[(arrayPosition + 3) % buttons.length] as Button).x = 594 + 190 * (1 - Math.cos(Math.PI * t))/2.0;
				}
			}
			else if (t > 0)
			{				
				t -= 1 / 60.0;
				
				if (t <= 0)
				{
					(buttons[(arrayPosition - 1 + buttons.length) % buttons.length] as Button).x = 800;
					
					for (var i:int = 0; i < 4; i++)
					{
						(buttons[(arrayPosition + i) % buttons.length] as Button).x = 38 + 91 + 155 * i;
					}
					
					t = 0;
				}
				else
				{
					(buttons[(arrayPosition - 1 + buttons.length) % buttons.length] as Button).x = -61 + 190 * (1 - Math.cos(Math.PI * t))/2.0;
					
					for (var i:int = 0; i < 3; i++)
					{
						(buttons[(arrayPosition + i) % buttons.length] as Button).x = 38 + 91 + 155 * i + 155 * (1 - Math.cos(Math.PI * t))/2.0;
					}
					
					(buttons[(arrayPosition + 3) % buttons.length] as Button).x = 594 + 190 * (1 - Math.cos(Math.PI * t))/2.0;
				}
				
			}
			else if (t < 0)
			{
				t += 1 / 60.0;
				
				if (t <= -1)
				{
					(buttons[(arrayPosition + 4) % buttons.length] as Button).x = 800;
					
					for (var i:int = 0; i < 4; i++)
					{
						(buttons[(arrayPosition + i) % buttons.length] as Button).x = 38 + 91 + 155 * i;
					}
					t = 0;
				}
				else
				{
					(buttons[arrayPosition] as Button).x = 129 - 190 * (1 - Math.cos(Math.PI * t))/2.0;
					
					for (var i:int = 1; i < 4; i++)
					{
						(buttons[(arrayPosition + i) % buttons.length] as Button).x = 38 + 91 + 155 * i - 155 * (1 - Math.cos(Math.PI * t))/2.0;
					}
					
					(buttons[(arrayPosition + 4) % buttons.length] as Button).x = 784 - 190 * (1 - Math.cos(Math.PI * t))/2.0;
				}
				
			}
		}
		
		public function get():void 
		{
			
		}
		
	}	

}