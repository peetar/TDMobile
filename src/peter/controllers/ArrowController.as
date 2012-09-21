package peter.controllers
{
	import flash.display.Sprite;
	
	import peter.graphics.AnimatedArrow;
	
	public class ArrowController extends Sprite
	{
		public var window:Sprite = new Sprite();
		public function ArrowController()
		{
			window = new AnimatedArrow("none");
			this.addChild(window);
		}
		public function spinTo(direction:String):void {
			this.removeChild(window);
			window = new AnimatedArrow(direction);
			this.addChild(window);
		}
	}
}