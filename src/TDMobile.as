package
{
	import flash.display.Sprite;
	
	import peter.controllers.TreasureGameController;
	import peter.screens.screen;
	import peter.screens.InitScreen;
	[SWF(width="800", height="600", backgroundColor="#ffffff", frameRate="30")]
	
	public class TDMobile extends Sprite
	{
		public var sampleController:TreasureGameController;
		
		public function TDMobile()
		{
			this.addChild(new InitScreen(800,600,0,0));
		}
	}
	
	
	
}