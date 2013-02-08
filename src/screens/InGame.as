package screens
{
	import flash.utils.getTimer;
	
	import objects.Enemies;
	
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
		
	
	public class InGame extends Sprite
	{
		private var enemies:Enemies;
		private var bg:Image;
		private var bar:Image;
		
		// vars for Ticker
		private var timePrevious:Number
		private var timeCurrent:Number;
		private var elapsed:Number;
		
		public var score:uint = 30;
		
		private var coins:uint;
		
		private var gameState:String; //Idle Play Over Variable
		
		public function InGame()
		{
			super();
			this.addEventListener(starling.events.Event.ADDED_TO_STAGE, onAddedToStage);
		}
		private function onAddedToStage(event:Event):void
		{
			this.removeEventListener(starling.events.Event.ADDED_TO_STAGE, onAddedToStage);
			
		}
		
		public function disposeTemp():void
		{
			this.visible = false;
		}
		
		public function initilize():void
		{
			//event listeners
			this.addEventListener(Event.ENTER_FRAME, checkElapsed);
			this.visible = true;
			drawGame();
			
			gameState = "idle";
			
			this.addEventListener(Event.ENTER_FRAME, onGameTick);
		}	
		
		private function onGameTick(event:Event):void
		{
			switch(gameState)
			{
				case "idle":
					break;
				case "play":
					break;
				case "over":
					break;
			}
		}
		
		private function drawGame():void
		{
			bg = new Image(Assets.getTexture("bg1"));
			this.addChild(bg);
			bar = new Image(Assets.getTexture("barImg"));
			this.addChild(bar);
			
			enemies = new Enemies(1);
			//enemies(3);
			this.addChild(enemies);
	
		}
		
		private function checkElapsed(event:Event):void
		{
			timePrevious = timeCurrent;
			timeCurrent = getTimer();// returns miliseconds since start
			elapsed = (timeCurrent - timePrevious)* 0.001;
		}
	}
}