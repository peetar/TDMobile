package peter.controllers
{
	
	
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	
	import peter.colors.StaticColors;
	import peter.nodes.GameNode;
	import peter.screens.GameOverScreen;

	public class TreasureGameController extends Sprite
	{
	public var nodeCollums:uint;
	public var nodeRows:uint;
	public var winWidth:uint = 800;
	public var winHeight:uint = 600;
	private var treasLoc:Array;
	private var monLoc:Array;
	private var nodeArray:Array;
	private var hintBoxArray:Array;
	private var hbFormat:TextFormat;
	private var nodeHolder:Sprite;
	private var hintBoxHolder:Sprite;
	public var correctGuesses:Number;
	public var guesses:Number;
	public var monsterTotal:int = 10;
	public var monsterClicked:Boolean;
	
	private var debug:Boolean = false;
		
	public function TreasureGameController(width:uint,height:uint, treas:uint, monsters:uint)
	{
		init();
		
		hintBoxArray = new Array();
		treasLoc = new Array();
		monLoc = new Array();
		nodeArray = new Array();
		hbFormat = new TextFormat();
		nodeCollums = width;
		nodeRows = height;
		monsterClicked = false;
		
		createNodes();
		assignTreasures(treas);
		assignMonsters(monsters);
		createHintBoxes(treas);
		scaleNodes();
		
	}
	
	private function init ():void {
		drawbackground();
		nodeHolder = new Sprite();
		hintBoxHolder = new Sprite();
		this.addChild(nodeHolder);
		this.addChild(hintBoxHolder);
		correctGuesses = 0;
		guesses = 0;
	}
	
	private function assignMonsters(monToAssign:int):void {
		for (var i:uint = 0; i< monToAssign;i++) {
			while (true) {
				var tempNum:Array = new Array();
				tempNum[0] = Math.floor(Math.random()*(nodeRows));
				tempNum[1] = Math.floor(Math.random()*(nodeCollums));
				var tempNode:GameNode = getNode(tempNum);
			
				if (!tempNode.isTreasure && !tempNode.isMonster ) {
					monLoc[i] = tempNum;
					
					tempNode.isMonster = true;
					break;
				}
			}
		}
		treasLoc = treasLoc.sort(); 
		trace ("monster locations" + monLoc);
		
	}
	
	public function endGame():void {
		var endGameScreen:GameOverScreen = new GameOverScreen(0,0,250,150,guesses,treasLoc.length,nodeCollums*nodeRows, monsterClicked);
		this.addChild(endGameScreen);
		endGameScreen.x = endGameScreen.y = 50;
	}
	
	private function scaleNodes():void {
		var myScale:Number = (winHeight/nodeHolder.height > winWidth/nodeHolder.width) ?  winWidth/nodeHolder.width : winHeight/nodeHolder.height;
		
		nodeHolder.scaleX = nodeHolder.scaleY = myScale* .9;
		nodeHolder.x = (winWidth - (hintBoxHolder.width + nodeHolder.width))/2;
		nodeHolder.y = (winHeight - ( nodeHolder.height))/2;
		
	}
	
	private function updateHints (nodePicked:Array):void {
		
		for (var i:uint = 0 ; i< treasLoc.length; i++) {
			var tempString:String = "";
			var rowPicked:uint = nodePicked[0];
			var collumPicked:uint = nodePicked[1];
			var treasureRow:uint = treasLoc[i][0] ;
			var treasureCol:uint = treasLoc[i][1] 
			if (debug) {trace("row Pick: " + rowPicked + " col Pick: " + collumPicked + " row treas: " + treasureRow + " col treas: " + treasureCol)}
			if (rowPicked > treasureRow) {
				tempString += "up";
			}
			else if (rowPicked < treasureRow) {
				tempString += "down";
			}
			
			
			if (collumPicked > treasureCol) {
				tempString += "left";
			}
			else if (collumPicked < treasureCol) {
				tempString += "right";
			}
			
			if (debug) {trace(tempString)};
			(hintBoxArray[i] as ArrowController).spinTo(tempString);
			if (tempString == "") {
				(hintBoxArray[i] as ArrowController).visible = false;
			}
		}
		
		
		
	}
	
	private function createHintBoxes (boxes:uint):void {
		
		hbFormat.align = TextFormatAlign.CENTER;
		hbFormat.size = 20;
		
		var hintBoxWindow:Sprite = new Sprite();
		hintBoxWindow.graphics.beginFill(StaticColors.DARK1,1)
		hintBoxWindow.graphics.lineStyle(2, StaticColors.HIGHLIGHT1);
		hintBoxWindow.graphics.drawRoundRect(0,0,100,winHeight - 50, 100/8,winHeight/8);
		hintBoxWindow.graphics.endFill();
	
		for (var i:uint = 0; i<boxes;i++) {
			//useTextBoxes();
			var tempController:ArrowController = new ArrowController();
			hintBoxArray[i] = tempController;
			
			tempController.x = 10;
			var space:int = (hintBoxWindow.height - boxes * tempController.height) / (boxes+1);
			tempController.y = space* (i+1) + tempController.height*(i);
			
			
			hintBoxWindow.addChild(tempController);
			
			
		}
		hintBoxHolder.addChild(hintBoxWindow);
		hintBoxWindow.x = -15 + (this.width - hintBoxWindow.width);
		hintBoxWindow.y = 15;
		
		function useTextBoxes():void {
			var tempBox:TextField = new TextField();
			tempBox.width = hintBoxWindow.width - 15;
			tempBox.height = 60;
			tempBox.border = true;
			tempBox.selectable = false;
			tempBox.x = 5;
			
			if (boxes > 9 ) {
				tempBox.scaleX = tempBox.scaleY = .95 * (hintBoxWindow.height / (tempBox.height *boxes));
			}
			
			var space:int = (hintBoxWindow.height - boxes * tempBox.height) / (boxes+1);
			tempBox.y = space* (i+1) + tempBox.height*(i);
			tempBox.defaultTextFormat = (hbFormat);
			
			hintBoxWindow.addChild(tempBox);
			hintBoxArray[i] = tempBox;
		}
	}
	
	public function getNode (targ:Array):GameNode {
		var returnMe:GameNode;
		for (var i:uint = 0; i < nodeArray.length ; i ++) {
			if ((nodeArray[i] as GameNode).myPosition[0] == targ[0] && (nodeArray[i] as GameNode).myPosition[1] == targ[1] ) {
				returnMe = nodeArray[i];
				break;
			}
		}
		return returnMe;
	}
	
	private function assignTreasures (howMany:uint):void {
		for (var i:uint = 0; i< howMany;i++) {
			while (true) {
				var tempNum:Array = new Array();
				tempNum[0] = Math.floor(Math.random()*(nodeRows));
				tempNum[1] = Math.floor(Math.random()*(nodeCollums));
				var tempNode:GameNode = getNode(tempNum);
				if (!tempNode.isTreasure) {
					treasLoc[i] = tempNum;
					tempNode.isTreasure = true;
					break;
				}
			}
		}
		treasLoc = treasLoc.sort(); 
		trace (treasLoc);
		
	}
	
	public function createNodes():void {
		var nameCounter:uint = 0;
		for (var i:uint = 0; i < nodeCollums; i++) {
			for (var j:uint = 0; j < nodeRows; j++) {
				var tempNode:GameNode = new GameNode();
				nodeHolder.addChild(tempNode);
				tempNode.x = i *(tempNode.width+5);
				tempNode.y = j *(tempNode.height+5);
				tempNode.internalName =  nameCounter;
				tempNode.myPosition = [j,i];
				nameCounter++;
				
				tempNode.addEventListener(MouseEvent.MOUSE_UP,nodeClickHandler,true);
				nodeArray.push(tempNode);
			}
		}
	}
	
	public function checkGame():void {
		correctGuesses++;
		if (correctGuesses >= treasLoc.length) {
			endGame();
		}
	}
	
	public function nodeClickHandler (e:MouseEvent):void {
		guesses ++;
		var nodeClicked:GameNode = e.currentTarget as GameNode;
		if (monsterNeighbors(nodeClicked)) {
			nodeClicked.showWarning();
		}
		nodeClicked.guessed = true;
		nodeClicked.removeEventListener(MouseEvent.MOUSE_UP,nodeClickHandler,true);
		if (nodeClicked.isTreasure) {
			nodeClicked.showTreasure();
			updateHints(nodeClicked.myPosition);
			checkGame();
		}
		else if (nodeClicked.isMonster) {
			nodeClicked.showMonster();
			updateHints(nodeClicked.myPosition);
			monsterClicked = true;
			endGame();
		}
		else {
			nodeClicked.removeNode();
			updateHints(nodeClicked.myPosition);
		}
		if (debug){trace(nodeClicked.internalName)};
	}
	
	private function monsterNeighbors(nodeClicked:GameNode):Boolean
	{
		var isMonster:Boolean = false;
		var neighbors:Array = new Array();
		var i:int = nodeClicked.myPosition[0];
		var j:int = nodeClicked.myPosition[1];
		var tempNode:GameNode;
		tempNode = getNode([i-1,j-1]);
		if (tempNode) {
		//	neighbors.push(tempNode);
		}
		tempNode = getNode([i,j-1]);
		if (tempNode) {
			neighbors.push(tempNode);
		}
		tempNode = getNode([i+1,j-1]);
		if (tempNode) {
		//	neighbors.push(tempNode);
		}
		tempNode = getNode([i-1,j]);
		if (tempNode) {
			neighbors.push(tempNode);
		}
		tempNode = getNode([i+1,j]);
		if (tempNode) {
			neighbors.push(tempNode);
		}
		tempNode = getNode([i-1,j+1]);
		if (tempNode) {
		//	neighbors.push(tempNode);
		}
		tempNode = getNode([i,j+1]);
		if (tempNode) {
			neighbors.push(tempNode);
		}
		tempNode = getNode([i+1,j+1]);
		if (tempNode) {
		//	neighbors.push(tempNode);
		}
		for (var k:int = 0 ; k< neighbors.length; k++) {
			if ((neighbors[k] as GameNode).isMonster) {
				isMonster = true;
			}
		}
		return isMonster;
	}
	
	public function drawbackground():void {
		
		var window:Sprite = new Sprite();
		this.addChild(window);
		window.graphics.beginFill(StaticColors.BACKGROUND2,1)
		window.graphics.lineStyle(2, StaticColors.HIGHLIGHT1);
		window.graphics.drawRoundRect(0,0,winWidth,winHeight, winWidth/8,winHeight/8);
		window.graphics.endFill();
	}
	
	public function areEqual(a:Array,b:Array):Boolean {
		if(a.length != b.length) {
			return false;
		}
		var len:int = a.length;
		for(var i:int = 0; i < len; i++) {
			if(a[i] !== b[i]) {
				return false;
			}
		}
		return true;
	}

}
}