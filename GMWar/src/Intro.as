package  
{
	import net.flashpunk.graphics.Image;
	import net.flashpunk.World;
    import net.flashpunk.utils.Draw;
    import net.flashpunk.utils.Input;
    import net.flashpunk.utils.Key;
	import net.flashpunk.Sfx;
    import net.flashpunk.FP;
	import UiClasses.UI;

    import traps.Tarpit;
    import traps.Turret;
    import traps.FirePit;
    import traps.PoisonTrap;
    import traps.Wall;
    import traps.TallWall;
	
	/**
	 * ...
	 * @author David
	 */
	public class Intro extends World 
	{
		public var trapMgr:TrapManager;
        public var peopleMgr:PeopleManager;
        public var paused:Boolean;
		public var ui:UI;

        public var money:int;

        public var yDiff:int
		
		[Embed (source = 'Asserts/Intro.png')]
		private static const BACKGROUND:Class
		private var background:Image = new Image(BACKGROUND);
		
		public function Intro() 
		{
			addGraphic(background,0);
		}


        public override function update():void
        {
            super.update()
            if(Input.mouseDown)
            {
                FP.world = new Environment();
            }
        }

		
	}

}
