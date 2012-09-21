package peter.nodes
{
	import flash.display.Sprite;
	
	import peter.colors.StaticColors;
	import peter.graphics.AnimatedChest;
	import peter.graphics.AnimatedWarning;
	import peter.graphics.redvirus;
	
	public class GameNode extends Sprite
	{
		public var nodeHeight:uint = 30;
		public var nodeWidth:uint = 30;
		public var guessed:Boolean = false;
		public var internalName:uint;
		public var myPosition:Array;
		public var isTreasure:Boolean = false;
		public var isMonster:Boolean = false;
		public var NodeSprite:Sprite;
		public function GameNode()
		{
			super();
			myPosition = new Array();
			NodeSprite = new Sprite();
			this.addChild(NodeSprite);
			NodeSprite.graphics.beginFill(StaticColors.LIGHT1,1)
			NodeSprite.graphics.lineStyle(2, StaticColors.DARK2);
			NodeSprite.graphics.drawRoundRect(0,0,nodeWidth,nodeHeight, nodeWidth/8,nodeHeight/8);
			NodeSprite.graphics.endFill();
		}
		
		public function showTreasure():void {
			NodeSprite.graphics.clear();
			var window:AnimatedChest = new AnimatedChest();
			this.addChild(window);
			window.scaleX = window.scaleY = nodeHeight / window.height;
		}
		public function showMonster():void {
			NodeSprite.graphics.clear();
			var window:redvirus = new redvirus();
			this.addChild(window);
			window.scaleX = window.scaleY = nodeHeight / window.height;
		}
		public function removeNode():void {
			NodeSprite.graphics.clear();
		}
		
		public function showWarning():void
		{
			NodeSprite.graphics.clear();
			var window:AnimatedWarning = new AnimatedWarning();
			this.addChild(window);
			window.scaleX = window.scaleY = nodeHeight / window.height;
		}
	}
}