package traps
{
import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
    import Effects.Fire;
    public class FirePit extends Trap
    {
        [Embed(source = '../Asserts/pit.png')]
		private const PLAYER:Class;
		private var image:Image = new Image(PLAYER);
		
        public function FirePit(x_:int)
        {
			graphic = image;
			super(x_);
            effects.push(new Fire(x,y))
            damage = new Damage("FIRE",1,8,0,this);
            price = 10;
            projectile = null;
            airbourne = false;
            tHeight = 0;
            tWidth = 40;
            scalibility = false;
            conApply = true;
            blocking = false;
        }
		
    }
}
