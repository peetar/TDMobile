package peter.graphics
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	public class BlittedGraphic extends Sprite
	{
		[Embed(source = 'arrowSheet.png')]
		public var TileSheet:Class;
		
		public var backGroundBitmapData:BitmapData ;
		
		public var canvasBitmapData:BitmapData ;
		
		
		public var canvasBitmap:Bitmap;
		public var tileCounter:int = 0;
		public var tileList:Array ;
		public var tileSheet:Bitmap;
		public var backBlitPoint:Point = new Point(0,0);
		public var tileBlitPoint:Point = new Point(0,0);
		public var blitRect24:Rectangle;
		public var tileWidth:int;
		public var tileHeight:int;
		public var tilesPerRow:int;
		private var iLoop:Boolean;
		
		public function BlittedGraphic(width:Number, height:Number, tileOrder:Array, tileBitmap:Bitmap, loop:Boolean) {
			iLoop = loop;
			tileSheet = tileBitmap;
			backGroundBitmapData = new BitmapData(width, height, false, 0x000000);
			canvasBitmapData = new BitmapData(width, height, true, 0xffffff);
			canvasBitmap = new Bitmap(canvasBitmapData);
			tileList = tileOrder;
			blitRect24 = new Rectangle(0, 0, width, height);
			tileWidth = width;
			tileHeight = height;
			tilesPerRow = tileSheet.width / tileWidth;
			
			
			addChild(canvasBitmap);
			addEventListener(Event.ENTER_FRAME, runDemo, false, 0, true);
		}
		
		private function runDemo(e:Event):void {
			canvasBitmapData.lock();
			canvasBitmapData.copyPixels(backGroundBitmapData,backGroundBitmapData.rect, backBlitPoint);
			
			blitRect24.x=int(tileList[tileCounter]% tilesPerRow)*tileWidth;
			blitRect24.y=int(tileList[tileCounter] / tilesPerRow)*tileHeight;
			
			canvasBitmapData.copyPixels(tileSheet.bitmapData,blitRect24, tileBlitPoint);
			
			canvasBitmapData.unlock();
			tileCounter++;
			if (tileCounter > tileList.length-1) {
				if (iLoop) {
					tileCounter = 0;
				}
				else {
					tileCounter --;
				}
			}
		}
	}
}