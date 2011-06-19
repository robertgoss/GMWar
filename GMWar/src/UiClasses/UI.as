package UiClasses
{
	import adobe.utils.CustomActions;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import flash.events.MouseEvent;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.utils.Input;

	/**
	 * ...
	 * @author David
	 */
	public class UI extends Entity
	{		
		// Button moving
		private var scrolling:int = 0;
		private var buttons:Array;
		private var t:Number = 0;
		private var arrayPosition:int;
		
		// Details information		
		public static var currentFocus:int = -1;
		public static var roledOver:int = -4;
		private var seq:Array;
		
		// Drawing
		public var details:Text;
		
		public function UI() 
		{
			super();
			setHitbox(1, 1);
			// Add buttons to screen //////////////////////////////////////////////
			FP.world.add(new Scroll(0, true, scrollL));
			FP.world.add(new Scroll(762, false, scrollR));
			buttons = [];
			arrayPosition = 0;
			
			for (var i:int = 0; i < 19; i++)
			{
				if (i < 4)
				{
					buttons.push(new Button(38 + 91 + 155 * i,i));
					FP.world.add(buttons[i] as Button);
				}
				else 
				{
					buttons.push(new Button(800,i));
					FP.world.add(buttons[i] as Button);
				}
			}
			details = new Text("", 640, 365, 146, 220);
			details.x = 640;
			details.y = 365;
			addGraphic(details);
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
		
		public override function update():void
		{
			if (scrolling > 0)
			{
				t -= 1 / 60.0;
				
				if (t <= -1)
				{
					(buttons[arrayPosition] as Button).x = 800;
					(buttons[(arrayPosition + 1) % buttons.length] as Button).x = 800;
					(buttons[(arrayPosition + 2) % buttons.length] as Button).x = 800;
					arrayPosition = (arrayPosition + 3) % buttons.length;
					
					for (var i:int = 0; i < 4; i++)
					{
						(buttons[(arrayPosition + i) % buttons.length] as Button).x = 38 + 91 + 155 * i;
					}
					
					scrolling--;
					t = 0;
				}
				else
				{
					for (i = 0; i < 3; i++)
					{
						(buttons[arrayPosition+i] as Button).x = 129 + 155 * i - (190 + 155 * 3) * (1 - Math.cos(Math.PI * t)) / 2.0;
					}
					
					(buttons[(arrayPosition + 3) % buttons.length] as Button).x = 38 + 91 + 155 * 3 - 155 * 3 * (1 - Math.cos(Math.PI * t))/2.0;
					
					for (i = 4; i < 7; i++)
					{
						(buttons[(arrayPosition + i) % buttons.length] as Button).x = 319 + 155 * i - (190 + 155 * 3) * (1 - Math.cos(Math.PI * t))/2.0;
					}
				}				
			}
			else if (scrolling < 0)
			{				
				t += 1 / 60.0;
				
				if (t >= 1)
				{
					(buttons[arrayPosition] as Button).x = 800;
					(buttons[(arrayPosition - 1 + buttons.length) % buttons.length] as Button).x = 800;
					(buttons[(arrayPosition - 2 + buttons.length) % buttons.length] as Button).x = 800;
					arrayPosition = (arrayPosition - 3 + buttons.length) % buttons.length;
					
					for (var i:int = 0; i < 4; i++)
					{
						(buttons[(arrayPosition + i) % buttons.length] as Button).x = 38 + 91 + 155 * i;
					}
					
					scrolling++;
					t = 0;
				}
				else
				{
					for (i = -3; i < 0; i++)
					{
						(buttons[(arrayPosition+i + buttons.length) % buttons.length] as Button).x = -61 + 155 * i + (190 + 155 * 3) * (1 - Math.cos(Math.PI * t)) / 2.0;
					}
					
				(buttons[(arrayPosition) % buttons.length] as Button).x = 38 + 91 + 155 * 3 * (1 - Math.cos(Math.PI * t))/2.0;
					
					for (i = 1; i < 4; i++)
					{
						(buttons[(arrayPosition + i) % buttons.length] as Button).x = 129 + 155*i  + (190 + 155 * 3) * (1 - Math.cos(Math.PI * t))/2.0;
					}					
				}
			}
			else if (t < 0)
			{				
				t -= 1 / 60.0;
				
				if (t <= 0)
				{
					(buttons[(arrayPosition - 1 + buttons.length) % buttons.length] as Button).x = 800;
					
					for (i = 0; i < 4; i++)
					{
						(buttons[(arrayPosition + i) % buttons.length] as Button).x = 38 + 91 + 155 * i;
					}
					
					t = 0;
				}
				else
				{
					(buttons[(arrayPosition - 1 + buttons.length) % buttons.length] as Button).x = -61 + 190 * (1 - Math.cos(Math.PI * t))/2.0;
					
					for (i = 0; i < 3; i++)
					{
						(buttons[(arrayPosition + i) % buttons.length] as Button).x = 38 + 91 + 155 * i + 155 * (1 - Math.cos(Math.PI * t))/2.0;
					}
					
					(buttons[(arrayPosition + 3) % buttons.length] as Button).x = 594 + 190 * (1 - Math.cos(Math.PI * t))/2.0;
				}
				
			}
			else if (t > 0)
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
					
					for (i = 1; i < 4; i++)
					{
						(buttons[(arrayPosition + i) % buttons.length] as Button).x = 38 + 91 + 155 * i - 155 * (1 - Math.cos(Math.PI * t))/2.0;
					}
					
					(buttons[(arrayPosition + 4) % buttons.length] as Button).x = 784 - 190 * (1 - Math.cos(Math.PI * t))/2.0;
				}				
			}
			
			var atMouse:Entity = collide("Soldier", Input.mouseX, Input.mouseY);
			if (atMouse != null)
			{
				roledOver = -1;
				seq = (atMouse as People).getSeq();
				details.text = "Soldier Skills\nSpeed: " + seq[1] + "\nClimbing: " + seq[2] + "\nArmour: " + seq[3];				
			}
			else
			{
				roledOver = -4;
				details.text = "";
			}
		}
		
	}	

}
