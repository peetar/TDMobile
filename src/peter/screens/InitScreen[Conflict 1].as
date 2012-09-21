package peter.screens
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFieldType;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	
	import peter.colors.StaticColors;
	import peter.controllers.TreasureGameController;
	import peter.nodes.GameNode;

	public class InitScreen extends screen
	{
		public function InitScreen(xloc:int, yloc:int, width:int, height:int)
		{
			this.backGroundAlpha = 1;
			this.backGroundColor = StaticColors.BACKGROUND1;
			this.strokeColor = StaticColors.BORDER1;
			
			super(0	, 0, 800, 600);
			drawHeader(window);
		}
		
		private function drawHeader(spr:Sprite):void
		{
			var header:Sprite = new Sprite();
			spr.addChild(header);
			var tf:TextField = new TextField();
			tf.borderColor = StaticColors.BORDER1;
			tf.border = true;
			
			tf.width = 600;
			tf.height = 70;

			tf.text = "Treasure Digger";
			tf.setTextFormat(new TextFormat("arial",50, StaticColors.HIGHLIGHT1, true,false,false,null,null, TextFormatAlign.CENTER));
			header.addChild(tf);
			tf.y = 10;
			tf.x = 100;
			
			var insTf:TextField = new TextField();
			insTf.borderColor = StaticColors.BORDER1;
			insTf.border = true;
			insTf.wordWrap = true;
			
			insTf.width = 400;
			insTf.height = 150;
			insTf.y = tf.y + tf.height +10;
			insTf.x = 200;
			insTf.text = 'Welcome to Treasure Digger by Peter Trice!\nYour objective is to locate the treasures. ' +
				'Click on a square to begin your hunt. Using your honed Treasure Hunter instincts, the arrows on the right ' +
				'will point to the location of each treasure.  But beware of the monsters randomly located around the treasure field. ' +
				'Find one, and your game is over.';
			insTf.setTextFormat(new TextFormat("arial",18, 0xFFFFFF, false,false,false,null,null, TextFormatAlign.CENTER));
			insTf.autoSize = TextFieldAutoSize.CENTER;
			spr.addChild(insTf);
			
			var optionsHolder:Sprite = new Sprite();
			spr.addChild(optionsHolder);
			optionsHolder.x = 100;
			optionsHolder.y = insTf.y + insTf.height +10;
			var labelFormat:TextFormat = new TextFormat("arial",18, 0xFFFFFF, false,false,false,null,null, TextFormatAlign.LEFT);
			var inputFormat:TextFormat = new TextFormat("arial",18, 0x000000, false,false,false,null,null, TextFormatAlign.LEFT);
			
			var label1:TextField = new TextField();
			label1.text = "Grid Size:";
			label1.border = true;
			optionsHolder.addChild(label1);
			label1.setTextFormat(labelFormat);
			label1.width = 100;
			label1.height = 24;
			label1. x = 5;
			label1.y = 10+ (label1.height+10) * 0;
			
			var label2:TextField = new TextField();
			label2.text = "Treasures:";
			label2.border = true;
			optionsHolder.addChild(label2);
			label2.setTextFormat(labelFormat);
			label2.width = 100;
			label2.height = 24;
			label2. x = 5;
			label2.y = 10+ (label1.height+10) * 1;
			
			var label3:TextField = new TextField();
			label3.text = "Monsters:";
			label3.border = true;
			optionsHolder.addChild(label3);
			label3.setTextFormat(labelFormat);
			label3.width = 100;
			label3.height = 24;
			label3. x = 5;
			label3.y = 10+ (label1.height+10) * 2;
			
			var input1:TextField = new TextField();
			input1.text = "10";
			input1.restrict = "0123456789";
			input1.border = true;
			input1.background = true;
			input1.type = TextFieldType.INPUT;
			optionsHolder.addChild(input1);
			input1.setTextFormat(inputFormat);
			input1.width = 50;
			input1.height = 24;
			input1.x = label1.width + 30;
			input1.y = label1.y;
			
			var input2:TextField = new TextField();
			input2.text = "5";
			input2.restrict = "0123456789";
			input2.border = true;
			input2.background = true;
			input2.type = TextFieldType.INPUT;
			optionsHolder.addChild(input2);
			input2.setTextFormat(inputFormat);
			input2.width = 50;
			input2.height = 24;
			input2.x = label2.width + 30;
			input2.y = label2.y;
			
			var input3:TextField = new TextField();
			input3.text = "10";
			input3.restrict = "0123456789";
			input3.border = true;
			input3.background = true;
			input3.type = TextFieldType.INPUT;
			optionsHolder.addChild(input3);
			input3.setTextFormat(inputFormat);
			input3.width = 50;
			input3.height = 24;
			input3.x = label3.width + 30;
			input3.y = label3.y;
			
			optionsHolder.graphics.lineStyle(2,StaticColors.BORDER1)
				optionsHolder.graphics.drawRect(0,0,optionsHolder.width + 20, optionsHolder.height + 20);
			optionsHolder.graphics.endFill();
			
			var goBtn:GameNode = new GameNode();
			optionsHolder.addChild(goBtn);
			var goTf:TextField = new TextField();
			goTf.text = "GO";
			goTf.width = goBtn.width;
			goTf.height = goBtn.height-5;
			goTf.y = 5;
			goTf.selectable = false;
			goTf.autoSize = TextFieldAutoSize.CENTER;
			
			goBtn.addChild(goTf);
			goBtn.x = 220;
			goBtn.y = 20;
			goBtn.scaleX = goBtn.scaleY = 3;
			
			goBtn.addEventListener(MouseEvent.CLICK,goGame);
		}
		
		protected function goGame(event:MouseEvent):void
		{
			var sampleController:TreasureGameController = new TreasureGameController(10,10,5);
			this.addChild(sampleController);
		}
	}
}