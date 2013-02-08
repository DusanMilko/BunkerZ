package screens
{
	import starling.display.Button;
	import starling.display.Sprite;
	import starling.events.Event;
	
	public class shop extends Sprite
	{
		//buttons
		private var replayBtn:Button;
		private var upgradeBtn:Button;
		private var inGame:Object;
		//private var inGame:InGame;
		
		public function shop()
		{
			super();
			
			replayBtn  = new Button(Assets.getTexture("buttonImg"));
			this.addChild(replayBtn);
			replayBtn.x = 100;
			replayBtn.y = 250;
			upgradeBtn  = new Button(Assets.getTexture("buttonImg"));
			this.addChild(upgradeBtn);
			upgradeBtn.x = 400;
			upgradeBtn.y = 300;
			this.addEventListener(Event.TRIGGERED, onMenuClick);
		}
		private function onMenuClick(event:Event):void
		{
			inGame = this.parent;
			trace(event.target as Button);
			if((event.target as Button)== replayBtn)
			{
				inGame.reset();
			}
			if((event.target as Button)== upgradeBtn)
			{
			   if(inGame.cost < inGame.score)
			   {
				   inGame.score = inGame.score - inGame.cost;
				   inGame.str ++;
			   }else
			   {
				   //play sound
			   }
			}
		}
	}
}