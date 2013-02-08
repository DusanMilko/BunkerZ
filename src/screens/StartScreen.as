package screens
{
	import com.greensock.TweenLite;
	
	import events.NavigationEvent;
	
	import starling.display.Button;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	
	public class StartScreen extends Sprite
	{
		private var bg:Image;
		private var title:Image;
		public var startBtn:Button;
		
		public function StartScreen()
		{
			super();
			this. addEventListener(starling.events.Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage(event:Event):void
		{
			drawScreen();
		}
		private function drawScreen():void
		{
			bg = new Image(Assets.getTexture("startScreenBgImg"));
			this.addChild(bg);
			
			//title = new Image(Assets.getAtlas().getTexture("xml file name like playerImg"));
			title = new Image(Assets.getTexture("titleImg"));
			title.x= 150;
			title.y= 200;
			this.addChild(title);
			
			startBtn = new Button(Assets.getTexture("startBtnImg"));
			startBtn.x = 180;
			this.addChild(startBtn);
			//startBtn.addEventListener(Event.TRIGGERED,);
			
			this.addEventListener(Event.TRIGGERED, onMainMenuClick);
		}	
		
		private function onMainMenuClick(event:Event):void
		{
			trace(event.target as Button);
			if((event.target as Button)== startBtn)
			{
				this.dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE_SCREEN,{id:"select"},true));
			}
		}
		public function disposeTemp():void
		{
			this.visible = false;
			if(this.hasEventListener(Event.ENTER_FRAME))this.removeEventListener(Event.ENTER_FRAME, startScreenAnime);
		}
		
		public function initialize():void
		{
			this.visible = true;
			//title
			startBtn.y = stage.height;
			TweenLite.to(startBtn,3,{y:260});
			//startBtn
			this.addEventListener(Event.ENTER_FRAME, startScreenAnime);
				
		}	
		private function startScreenAnime(event:Event):void
		{
			var currentDate:Date = new Date();
			title.y = 100 + (Math.cos(currentDate.getTime() * 0.002) * 10);
		}
	}
}