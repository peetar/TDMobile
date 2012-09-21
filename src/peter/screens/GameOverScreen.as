package peter.screens
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	
	import peter.colors.StaticColors;
	import peter.controllers.TreasureGameController;
	import peter.graphics.redvirus;

	public class GameOverScreen extends screen
	{
		public var newGameButton:Sprite;
		public var failed:Boolean;
		public var score:int;
		
		public function GameOverScreen(xloc:int, yloc:int, wid:int, hei:int, guesses:int, treasures:int, size:int, monsterClicked:Boolean)
		{
			//wid = 600;
			//hei = 300;
			failed = monsterClicked;
			this.backGroundAlpha = 1;
			this.backGroundColor = StaticColors.BACKGROUND1;
			this.strokeColor = StaticColors.BORDER1;
			super(xloc, yloc, wid, hei);
			
			score = size / (guesses - treasures);
			
			createNewGameButton();
		}
		
		public function createNewGameButton():void {
			newGameButton = new Sprite();
			newGameButton.graphics.beginFill(StaticColors.DARK2)
			newGameButton.graphics.lineStyle(2,StaticColors.BORDER1)
			newGameButton.graphics.drawRoundRect(0,0,150,100,10);
			this.addChild(newGameButton);
			var tf:TextField = new TextField();
			tf.selectable = false;
			tf.textColor = StaticColors.HIGHLIGHT1;
			tf.text = "Congratulations!\nYour score is: " + score + "\n<New Game>";
			if (failed) {
				tf.text = "You failed!\n <New Game>";
				var window:redvirus = new redvirus();
				this.addChild(window);
				window.scaleX = window.scaleY = 100 / 50;
			}
			newGameButton.addChild(tf);
			newGameButton.x = newGameButton.y = 50;
			newGameButton.addEventListener(MouseEvent.MOUSE_UP,createNewGame,true);
		}
		
		public function createNewGame(e:MouseEvent):void {
			
			newGameButton.removeEventListener(MouseEvent.MOUSE_DOWN,createNewGame);
			
		//	newGameButton.parent.parent.parent.addChild(new InitScreen(0,0,800,600));
			newGameButton.parent.parent.parent.removeChild(newGameButton.parent.parent);
			
		}
		
		
	}
}