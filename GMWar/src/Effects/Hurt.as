package  Effects
{
    import net.flashpunk.FP
    import net.flashpunk.graphics.Text

    public class Hurt extends Effect
    {
        private var dur:int
        public function Hurt(x:int,y:int,pain:int)
        {
            dur = 20; 
            graphic = new Text(pain.toString(),x,y,{size:8})
        }

        public override function update():void
        {
            dur = dur-1;
            y -= 1;
            if(dur<0)
            {
                FP.world.remove(this);
            }
        }
    }
}
