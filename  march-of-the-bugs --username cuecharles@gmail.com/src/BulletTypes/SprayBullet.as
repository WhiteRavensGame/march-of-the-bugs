package BulletTypes 
{
	/**
	 * ...
	 * @author Vali
	 */
	public class SprayBullet extends AnimatedBullet
	{
		[Embed(source = '../Assets/Animation.swf', symbol = 'SprayAnimation')]
		public var imgAnim:Class;
		
		public function SprayBullet(angle:Number) 
		{
			super(angle);
			super.clip = new imgAnim();
		}
		
	}

}