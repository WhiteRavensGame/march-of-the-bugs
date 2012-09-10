package  
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	/**
	 * ...
	 * @author Vali
	 */
	public class Bullet extends Sprite
	{
		public var angle:Number = 0;
		public var sprite:Sprite = new Sprite();
		
		public function Bullet(angle:Number) 
		{
			this.angle = angle;
			this.rotation = angle;
			this.addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		public function init(e:Event):void {
		
			addChild(sprite);
			
		}
		
		
		
	}

}