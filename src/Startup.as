package
{
	import flash.display.Sprite
	import starling.core.Starling;
	
	[SWF(framerate = "30", width="640", height="480", backgroundColor="0x777777")]
	public class Startup extends Sprite
	{
		private var myStarling:Starling;
		
		public function Startup()
		{
			myStarling = new Starling(Game, stage);
			myStarling.antiAliasing = 1;
			myStarling.start();
		}
	}
}