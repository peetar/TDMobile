package peter.screens
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.filters.GlowFilter;
	import peter.colors.StaticColors;
	
	public class closeButton extends Sprite
	{
		public var strokeColor:uint = StaticColors.BORDER1;
		public var bgColor:uint = StaticColors.HIGHLIGHT1;
		public var window:Sprite;
		public var myParent:screen;
		private var overFilter:GlowFilter;
		
		public function closeButton()
		{
			window = new Sprite();
			
			
			drawButton();
			addListeners(window);
			overFilter = new GlowFilter();
			
		}
		
		private function drawButton():void {
			var window:Sprite = new Sprite();
			this.addChild(window);
			window.graphics.beginFill(bgColor,.7)
			window.graphics.lineStyle(2, strokeColor);
			window.graphics.drawRoundRect(0,0,20,20, 4,4);
			window.graphics.endFill();
			
			window.graphics.lineStyle(2, strokeColor);
			window.graphics.moveTo(3,3);
			window.graphics.lineTo(17,17);
			window.graphics.moveTo(3,17);
			window.graphics.lineTo(17,3);
			
			
		}
		private function addListeners(targ:Sprite):void {
			this.addEventListener(MouseEvent.MOUSE_DOWN,mouseDown,true);
			this.addEventListener(MouseEvent.MOUSE_OVER,mouseOver,true)
			this.addEventListener(MouseEvent.MOUSE_OUT,mouseOut,true)
		}
		
		private function mouseDown(e:MouseEvent):void {
			(this.parent.parent as screen).closeWindow();
		}
		private function mouseOver(e:MouseEvent):void {
			this.filters = [overFilter];
		}
		private function mouseOut(e:MouseEvent):void {
			this.filters = [];
		}
		
		
		
		
		
		
	}
}