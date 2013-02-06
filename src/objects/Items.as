package objects
{
	import starling.display.Image;
	import starling.display.*;
	import starling.events.Event;
	
	public class Items extends Sprite
	{
		private var _type:int;
		private var _speed:int;
		private var _distance:int;
		private var _hit:Boolean;
		private var _position:String;
		private var itemImg:Image;
		private var itemAnime:MovieClip;
			
		public function Items(_type: )
		{
			super();
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		private function onAddedToStage(event:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
	}
}