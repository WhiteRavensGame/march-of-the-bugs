package BulletTypes 
{
	import flash.events.Event;
	import flash.display.MovieClip
	/**
	 * ...
	 * @author Vali
	 */
	public class SmashBullet extends AnimatedBullet
	{
		[Embed(source = '../Assets/Animation.swf', symbol = 'SmashAnimation')]
		public var imgAnim:Class;
		public function SmashBullet() 
		{
				super(0);
				super.clip = new imgAnim();
		}
		override public function init(e:Event):void {
			
			addChild(clip);
			clip.play();
			clip.addEventListener(Event.ENTER_FRAME, removeBullet);
			x = this.width / 2;
			y = this.height / 2;
			
		}
		
		
	}

}