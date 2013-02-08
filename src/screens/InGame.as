package screens
{
	//import classes
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import flash.utils.getTimer;
	
	import events.NavigationEvent;
	
	import objects.Enemies;
	
	import starling.display.Button;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.text.TextField;
		
	
	public class InGame extends Sprite
	{
		//create var for imported classes
		private var enemies:Enemies;
		private var myshop:shop;
		//parent
		private var game:Object;
		
		public var kills:uint = 2;
		public var killed:uint = 0;
		
		//bg
		private var bg:Image;
		private var bar:Image;
		
		//buttons
		
		
		//floor timer score
		public var floor:uint = 1;
		public var floorText:TextField;
		private var time:uint = 10;
		private var timerText:TextField;
		private var lvlTimer:Timer = new Timer(1000, time); //3 must equal time
		private var clearText:TextField;
		private var clearTimer:Timer = new Timer(1000, 2);
		public var score:uint = 1;
		public var scoreText:TextField;
		public var str:uint = 1;
		public var cost:uint = 5;
		
		// vars for Ticker
		private var timePrevious:Number
		private var timeCurrent:Number;
		private var elapsed:Number;
		private var gameState:String; //Idle Play Over
		
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
			this.visible = true;
			if(bg == null)
			{
				drawGame();
			}else
			{
				enemies.makeZombies(kills);	
			}
		}	
			
		private function drawGame():void
		{
			bg = new Image(Assets.getTexture("bg1"));
			this.addChild(bg);
			bar = new Image(Assets.getTexture("barImg"));
			this.addChild(bar);
			
			floorText = new TextField(150,30,"floor " + floor,"MyFontName",32,0xffffff)
			this.addChild(floorText);
			floorText.border = true;
			floorText.x = 20;
			floorText.y = 2;
				
			timerText = new TextField(220,45,"time " + time,"MyFontName",42,0x990000)
			this.addChild(timerText);
			timerText.x = 220;
			timerText.y = 2;
			timerText.border = "true";
			lvlTimer.addEventListener(TimerEvent.TIMER, timerListener);
			lvlTimer.start()
				
			scoreText = new TextField(150,30,"score " + score,"MyFontName",32,0xffffff)
			this.addChild(scoreText);
			scoreText.x = 455;
			scoreText.y = 2;
			
			makeEnemies();
		}
				
		public function makeEnemies():void
		{
			enemies = new Enemies();
			this.addChild(enemies);
			enemies.makeZombies(kills);	
		}
		
		public function makeFloor():void
		{
			lvlTimer.stop();
			killed = 0;
			floorText.text = ("floor " + floor);
			timerText.text = ("time " + time);
			clearText = new TextField(400,50,"CLEARED FLOOR " + floor,"MyFontName",34,0xffffff)
			this.addChild(clearText);
			floor ++;
			clearText.border = true;
			clearText.x = 120;
			clearText.y = 200;	
			
			this.removeChild(myshop);
			while(enemies.numChildren > 0)
			{
				enemies.removeChildAt(0);
			}
			//timer will clear text
			clearTimer.addEventListener(TimerEvent.TIMER, cleartimerListener);
			clearTimer.start();
		}
		
		private function cleartimerListener(e:TimerEvent):void
		{
			this.removeChild(clearText);
			clearTimer.removeEventListener(TimerEvent.TIMER, cleartimerListener);
			
			// if win
			var game:Object = this.parent;
			
			var isWhole:Boolean = (floor/10) % 1 == 0;
			if(isWhole == true){
				
				game.section ++;
				
				time = 10;
				lvlTimer.reset();
				killed = 0;
				floorText.text = ("floor " + floor);
				timerText.text = ("time " + time);
				
				while(enemies.numChildren > 0)
				{
					enemies.removeChildAt(0);
				}
				
				this.dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE_SCREEN,{id:"select"},true));
				
			}else{
				enemies.makeZombies(kills);
				lvlTimer.start();
			}
		}

		//timer
		private function timerListener(e:TimerEvent):void
		{
			time = time-1;
			timerText.text = ("time " + time);
			if(time == 0)
			{
				timerText.text = ("brains");
				lvlTimer.stop()
				// once you have menuBtn put this in draw
				myshop = new shop();
				this.addChild(myshop);
			}
		}
			
		public function reset():void
		{
			trace("reset");
			time = 10;
			lvlTimer.reset();
			lvlTimer.start();
			floor = 1;
			killed = 0;
			floorText.text = ("floor " + floor);
			timerText.text = ("time " + time);
			this.removeChild(myshop);
			while(enemies.numChildren > 0)
			{
				enemies.removeChildAt(0);
			}
			enemies.makeZombies(kills);
		}
	}
}