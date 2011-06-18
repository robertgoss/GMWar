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
            effects.push(new Fire(rel_x(x,y),rel_y(x,y)))
            effects.push(new Fire(rel_x(x+20,y),rel_y(x+20,y)))
            effects.push(new Fire(rel_x(x+40,y),rel_y(x+40,y)))
            effects.push(new Fire(rel_x(x+60,y),rel_y(x+60,y)))
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
