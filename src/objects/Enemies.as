package objects
{
	import starling.display.Sprite;
	
	public class Enemies extends Sprite
	{
		
		public var zombie:Zombie;
		
		public function Enemies(amount):void
		{
			super();
			
			for(var i:uint = 0; i < amount; i++){
				makeZombies();
			}
			
		}
		
		private function makeZombies():void
		{
			zombie = new Zombie();
			this.addChild(zombie);
		}
		
	}
}