package
{
	import flash.display.Sprite;
	
	import peter.controllers.TreasureGameController;
	import peter.screens.InitScreen;
	import peter.screens.screen;

	[SWF(width="800", height="600", backgroundColor="#ffffff", frameRate="30")]

	public class TreasureDigger extends Sprite
	{
		public var sampleController:TreasureGameController;
		
		public function TreasureDigger()
		{
//			var lsdkjf:AnimatedArrow = new AnimatedArrow(7);
//			this.addChild(lsdkjf);
			
//			sampleController = new TreasureGameController(10,10,5,10);
			//this.addChild(sampleController);
			this.addChild(new InitScreen(800,600,0,0));
		}
	}
	
	
	
}