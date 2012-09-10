package BulletTypes 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	/**
	 * ...
	 * @author Vali
	 */
	public class AnimatedBullet extends Bullet
	{
		public var clip:MovieClip = new MovieClip();
		public function AnimatedBullet(angle:Number) 
		{
			super(angle);
		}
		override public function init(e:Event):void {
			
			addChild(clip);
			clip.play();
			clip.addEventListener(Event.ENTER_FRAME, removeBullet);
			clip.y = -this.height / 2;
			
		}
		
		public function removeBullet(event:Event):void {
			if (MovieClip(event.target).currentFrame == MovieClip(event.target).totalFrames) {
				
				clip.removeEventListener(Event.ENTER_FRAME, removeBullet);
				this.parent.removeChild(this);
			}
		}
	}

}