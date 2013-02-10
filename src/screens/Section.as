package screens
{
	import events.NavigationEvent;
	
	import starling.display.Button;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.text.TextField;
	
	public class Section extends Sprite
	{
		private var game:Object;
		public var openSection:uint;
				
		private var shopBtn:Button;
		private var sectionBtn:Button;
		
		public var btnE:Event;//made event
		
		public function Section()
		{
			super();
			this.addEventListener(starling.events.Event.ADDED_TO_STAGE, onAddedToStage);	
		}
		
		private function onAddedToStage(e:Event):void
		{
			game = this.parent;
			openSection = game.section;
		
			for(var i:uint = 0; i < openSection; i ++)
			{
				sectionBtn = new Button(Assets.getTexture("buttonImg"));
				this.addChild(sectionBtn);
				sectionBtn.scaleY = 0.2;
				sectionBtn.x = 400;
				sectionBtn.y = 100 + (40*i);
				sectionBtn.name = String(i+1);
				//sectionBtn.addEventListener(Event.TRIGGERED, onMenuClick);
			}

			this.addEventListener(Event.TRIGGERED, onMenuClick);
		}
		
			
		private function onMenuClick(e:Event):void
		{
			game = this.parent;
			game.level = uint((e.target as Button).name);
			//game.selctedLevel(); 
			//dispatchEvent(new Event("selected", true));
			this.dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE_SCREEN,{id:"play"},true));
		}	
	}
}