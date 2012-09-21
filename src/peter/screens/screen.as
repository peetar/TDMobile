package peter.screens
{
	import flash.display.Sprite;
	
	import peter.screens.closeButton;
	
	
	public class screen extends Sprite
	{
		public var backGroundColor:uint;
		public var backGroundAlpha:Number = 0;
		public var window:Sprite;
		public var closeMe:closeButton;
		public var strokeColor:uint;
		
		public function screen(xloc:int,yloc:int,width:int,height:int)
		{
			window = new Sprite();
			
			drawWindow(xloc,yloc,width,height);
			drawCloseButton()
		}
		
		private function drawWindow(xloc:int,yloc:int,wid:int,hei:int):void {
			
			if (!backGroundAlpha) {backGroundAlpha = .95}
			if (!backGroundColor) {backGroundColor = 0x111111}
			if (!strokeColor) {strokeColor = 0xFF0000}
			
			this.addChild(window);
			window.graphics.beginFill(backGroundColor,backGroundAlpha)
			window.graphics.lineStyle(2, strokeColor);
			window.graphics.drawRect(0,0,wid,hei);
			window.graphics.endFill();
			window.x = xloc;
			window.y = yloc;
				
				
		}
		private function drawCloseButton():void {
			closeMe = new closeButton();
			window.addChild(closeMe);
			closeMe.x = window.width - closeMe.width - 2;
			closeMe.y = 2;
		}
		
		public function closeWindow():void {
			this.parent.removeChild(this);
		}
	}
}