package peter.graphics
{
	 import peter.graphics.BlittedGraphic;
	 
	public class AnimatedArrow extends BlittedGraphic {
		
	[Embed(source = 'arrowSheet.png')]
	private var arrowGraphic:Class;
	
	public function AnimatedArrow(direction:String)
	{
		var order:Array = new Array();
		switch (direction) {
			case "down":
				order = [8,9,10,11,12,13,14,15,16,17,18,19,0];
				break;
			case "downleft":
				order = [10,11,12,13,14,15,16,17,18,19,0,1,2,3];
				break;
			case "left":
				order = [10,11,12,13,14,15,16,17,18,19,0,1,2,3,4,5];
				break;
			case "upleft":
				order = [14,15,16,17,18,19,0,1,2,3,4,5,6,7,8];
				break;
			case "up":
				order = [15,16,17,18,19,0,1,2,3,4,5,6,7,8,9,10];
				break;
			case "upright":
				order = [0,1,2,3,4,5,6,7,8,9,10,11,12,13];
				break;
			case "right":
				order = [16,17,18,19,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15];
				break;
			case "downright":
				order = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18];
				break;
			case "none":
				order = [0];
				break;
		}
		
		super(64,64,order,new arrowGraphic(),false);
	}
}
}
			
		
