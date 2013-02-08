package objects
{
	import starling.display.Sprite;
	
	public class Enemies extends Sprite
	{
		
		public var zombie:Zombie;
		private var dad:Object = this.parent;
		
		public function Enemies():void
		{
			super();
		}
		
		public function makeZombies(amount):void
		{
			for(var i:uint = 0; i < amount; i++)
			{
				zombie = new Zombie();
				this.addChild(zombie);
			}
	
		}
		
	}
}