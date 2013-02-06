package
{
	import events.NavigationEvent;
	
	import screens.InGame;
	import screens.StartScreen;
	
	import starling.display.Sprite;
	import starling.events.Event;
	
	public class Game extends Sprite
	{
		//Screens
		private var startScreen:StartScreen;
		private var inGameScreen:InGame;
		public var level:uint;
		
		public function Game()
		{
			super();
			this. addEventListener(starling.events.Event.ADDED_TO_STAGE, onAddedToStage);
			
		}
		private function onAddedToStage(event:Event):void
		{
			//listen to navigation
			this.addEventListener(events.NavigationEvent.CHANGE_SCREEN, onChangeScreen);
			
			startScreen = new StartScreen();
			this.addChild(startScreen);
			startScreen.initialize();
			
			inGameScreen = new InGame();
			this.addChild(inGameScreen);
			inGameScreen.disposeTemp();
			
		}
		private function onChangeScreen(event:NavigationEvent):void
		{
			switch(event.params.id)// takes in given param from nav
			{
				case "play":
					startScreen.disposeTemp();
					inGameScreen.initilize();
					break;
			}
		}
		
	}
}