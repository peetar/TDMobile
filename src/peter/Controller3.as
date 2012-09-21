package peter
{
	import flash.display.Sprite;

	public class Controller3 extends Sprite
	{
		var iwidth:uint;
		var iheight:uint;
		public function Controller3(width:uint,height:uint)
		{
			iwidth = width;
			iheight = height;
			createNodes();
			drawbackground();
		}
		public function createNodes():void {
			
		}
		public function drawbackground():void {
			var winWidth = stage.width-20;
			var winWidth = stage.height-20;
			var window:Sprite = new Sprite();
			this.addChild(window);
			window.graphics.beginFill(backGroundColor,backGroundAlpha)
			window.graphics.lineStyle(2, strokeColor);
			window.graphics.drawRoundRect(0,0,winWidth,winHeight, winWidth/8,winHeight/8);
			window.graphics.endFill();
		}
		
}