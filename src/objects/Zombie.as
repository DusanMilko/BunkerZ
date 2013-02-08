package objects
{
	import com.greensock.TweenLite;
	
	import starling.core.Starling;
	import starling.display.Image;
	import starling.display.MovieClip;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	
	public class Zombie extends Sprite
	{
		private var zombieArt:MovieClip;
		private var zombieDead:Image;
		private var xlocation:uint; 
		private var ylocation:uint;
		private var runtoX:uint;
		private var runtoY:uint;
		
		public function Zombie()
		{
			super();
			this.addEventListener(starling.events.Event.ADDED_TO_STAGE, onAddedToStage);
			this.addEventListener(starling.events.Event.ENTER_FRAME, changeDirection);
		}
		private function onAddedToStage(event:Event):void
		{
			zombieArt = new starling.display.MovieClip(Assets.getAtlas().getTextures("zomWD"), 4);
			zombieArt.x = Math.ceil(zombieArt.width*0.5);//sprite size
			zombieArt.y = Math.ceil(zombieArt.height*0.5);//sprite size
			starling.core.Starling.juggler.add(zombieArt);//anime function
			//this.setChildIndex( zombieArt, 5);
			this.addChild(zombieArt);
			
			//start point
			xlocation = Math.ceil(Math.random()*(stage.stageWidth-zombieArt.width));
			ylocation = Math.ceil(Math.random()*(stage.stageHeight-zombieArt.height));	
			zombieArt.x = xlocation;
			zombieArt.y = ylocation;
			
			run();
			
			this.addEventListener(TouchEvent.TOUCH, zomClick);
		}
	
		public function run():void
		{		
			runtoX = Math.ceil(Math.random()*(stage.stageWidth-zombieArt.width));
			runtoY = Math.ceil(Math.random()*(stage.stageHeight-zombieArt.height));
			if(runtoY < 60)
			{
				runtoY = 60;
			}
			var speed:int = (Math.sqrt(ylocation*xlocation + runtoY*runtoX))/30;
			TweenLite.to(zombieArt,speed,{x:runtoX ,y:runtoY});
		}
		private function changeDirection(event:Event):void
		{
			if( zombieArt.x > (runtoX-50) && zombieArt.x < (runtoX+50) )
			{
				run();
			}
		}
		
		
		private function zomClick(event:TouchEvent):void
		{
			var touch:Touch = event.getTouch(this, TouchPhase.BEGAN);
			if (touch)
			{
				
				zombieDead = new Image(Assets.getAtlas().getTexture("zomDead"));
				this.removeChild(zombieArt);
				this.addChild(zombieDead);
				zombieDead.x = zombieArt.x;
				zombieDead.y = zombieArt.y;
				
				//TEST-------------------------------
				
				//This works only line under
				this.parent.setChildIndex(this, 1);
				/*
				trace(this.parent.getChildAt(1).pivotY + " " + zombieDead.y);
				//this.parent.getChildAt(5).visible = false;
				//this.parent.swapChildren( this.parent.getChildAt(1), this );
				
				for( var i:uint = 0; i<this.parent.numChildren; i++){
					
					if( this.parent.getChildAt(i).y < this.y ){
						this.parent.swapChildren( this.parent.getChildAt(i), this );
					}
					
				}
				*/
				
				//END TEST---------------------------
				
				this.removeEventListener(TouchEvent.TOUCH, zomClick);		
				
			}
		}
	}
}