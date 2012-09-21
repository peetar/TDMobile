package peter.graphics
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	public class AnimatedChest extends Sprite{
		[Embed(source = 'animated-chest.png')]
		private var TileSheet:Class;
		
		private var backGroundBitmapData:BitmapData =
			new BitmapData(90, 60, false, 0x000000);
		
		
		private var canvasBitmapData:BitmapData =
			new BitmapData(90, 60, true, 0xffffff);
		
		
		
		private var canvasBitmap:Bitmap = new Bitmap(canvasBitmapData);
		private var tileCounter:int = 0;
		private var tileList:Array = [0,0,0 ,1,1,1, 2,2,2, 3,3,3, 4,4,4, 5,5,5, 6,6,6, 7,7,7, 8,8,8, 9,9,9, 10,10,10, 11,11,11, 12,12,12, 13,13,13 ];
		private var tileSheet:Bitmap=new TileSheet();;
		private var backBlitPoint:Point = new Point(0,0);
		private var tileBlitPoint:Point = new Point(0,0);
		private var blitRect24:Rectangle = new Rectangle(0,0,90,60)
		private var tileWidth:int = 90;
		private var tileHeight:int = 60;
		private var tilesPerRow:int = tileSheet.width / tileWidth;
		public function AnimatedChest() {
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
				tileCounter --;
			}
		}
	}
}
