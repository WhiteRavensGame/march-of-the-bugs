package BulletTypes 
{
	/**
	 * ...
	 * @author Vali
	 */
	import flash.events.Event;
	public class NeedleBullet extends Bullet
	{
		[Embed(source = '../Assets/needlebulletsprite.png')]
		public var imgSprite:Class;
		public var distance:int = 0;
		public function NeedleBullet(angle:Number, distance:int) 
		{
			this.distance = distance;
			super(angle);
			sprite.addChild(new imgSprite());
			this.addEventListener(Event.ENTER_FRAME, removeBullet);
			
		}
		
		public function removeBullet(event:Event):void {
			this.x+= 10;
			if (x >= distance) {
				
				this.removeEventListener(Event.ENTER_FRAME, removeBullet);
				this.parent.removeChild(this);
			}
		}
		
	}

}