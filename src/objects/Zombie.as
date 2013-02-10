package objects
{
	
	//import classes
	import com.greensock.TweenLite;
	
	import flash.utils.getTimer;
	
	import starling.core.Starling;
	import starling.display.Image;
	import starling.display.MovieClip;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	//import starling.text.TextField;
	
	public class Zombie extends Sprite
	{
		//create var for imported classes
		private var inGame:Object;
		
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
			
			var ys:Number = Math.abs(ylocation - runtoY);
			var xs:Number = Math.abs(xlocation - runtoX);
			var dist:Number = (Math.sqrt( ys*ys+xs*xs ));
			
			var speed:Number = dist/25;
			
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
<<<<<<< HEAD


			inGame = this.parent.parent;
			
=======
			trace("clicked zom");
			inGame = this.parent.parent;
			trace(inGame);
>>>>>>> origin/Peter
			var touch:Touch = event.getTouch(this, TouchPhase.BEGAN);
			if(touch)
				{		
					trace("this ran 1");
					inGame.score ++;
					inGame.scoreText.text = "score "+ inGame.score;	
					inGame.killed ++;
					if(inGame.kills == inGame.killed)//make new floor
					{
						inGame.makeFloor();
						trace("this ran 2");
					}
<<<<<<< HEAD
					
				}
				*/
				
				//END TEST---------------------------
				
				this.removeEventListener(TouchEvent.TOUCH, zomClick);		

				
					var touch:Touch = event.getTouch(this, TouchPhase.BEGAN);
					if(touch)
					{			
						this.removeEventListener(TouchEvent.TOUCH, zomClick);
						inGame.score ++;
						inGame.scoreText.text = "score "+ inGame.score;
=======
					else{
>>>>>>> origin/Peter
						
						zombieDead = new Image(Assets.getAtlas().getTexture("zomDead"));
						this.removeChild(zombieArt);
						this.addChild(zombieDead);
						zombieDead.x = zombieArt.x;
						zombieDead.y = zombieArt.y;
							
						trace("this ran 3");
						//this.parent.setChildIndex(this, 1);	
						}
<<<<<<< HEAD
					}//End if
			
			}
=======
				}
			this.removeEventListener(TouchEvent.TOUCH, zomClick);
>>>>>>> origin/Peter
		}
	}
}