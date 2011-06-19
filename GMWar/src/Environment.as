package  
{
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.World;
    import net.flashpunk.utils.Draw;
    import net.flashpunk.utils.Input;
    import net.flashpunk.utils.Key;
	import net.flashpunk.Sfx;
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
	public class Environment extends World 
	{
		public var trapMgr:TrapManager;
        public var peopleMgr:PeopleManager;
        public var paused:Boolean;
		public var ui:UI;

        public var money:int;

        public var yDiff:int
		
		//Background Music
		[Embed (source = 'Asserts/BackgroundMusic.mp3')]
		private static const MUSIC:Class
		private var music:Sfx = new Sfx(MUSIC);
		
		[Embed (source = 'Asserts/guiBackground_2.png')]
		private static const BACKGROUND:Class
		private var background:Image = new Image(BACKGROUND);
		
		public function Environment() 
		{
			peopleMgr = new PeopleManager();
            trapMgr = new TrapManager(); 
            //yDiff = 150;// - rob
            yDiff = 350;
            //Add Floor
			addGraphic(background, 0);
            money = 1000;
		}

        public override function begin():void
        {
            super.begin()
            trapMgr.addTrap(new Turret(180));
            trapMgr.addTrap(new Tarpit(780));
            trapMgr.addTrap(new Wall(350));
            trapMgr.addTrap(new TallWall(1010));
			//music.loop();
			
			ui = new UI();
			add(ui);
        }

        public override function update():void
        {
            super.update()
            if(Input.pressed(Key.P))
            {
                paused = !paused;
            }
            if(!paused)
            {
                peopleMgr.update()
                trapMgr.update()
            }
        }

        public override function render():void
        {
            Draw.line(0,floorHieght(0),800,floorHieght(800),0xFFFFFF)
            Draw.line(0,floorHieght(0)+yDiff,800,floorHieght(800)+yDiff,0xFFFFFF)
            super.render()

            Draw.graphic(new Text(money.toString(),40,40))
            //Draw.line(200,floorHieght(0),200,0,0xFFFFFF)
            //Draw.line(350,floorHieght(0),350,0,0xFFFFFF)
        }
		
        public function floorHieght(x:int):int
        {
            return 200;
        }
		
	}

}
