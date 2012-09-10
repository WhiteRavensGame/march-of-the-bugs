package TurretTypes 
{
	import BulletTypes.NeedleBullet;
	/**
	 * ...
	 * @author Vali
	 */
	public class NeedleGun1 extends Turret
	{
		[Embed(source = '../Assets/turret/needlegunsprite.png')]
		public var imgSprite:Class;
		public function NeedleGun1(parentTile:Tile, direction:uint) 
		{
			super(parentTile, direction, true);
			super.sprite.addChild(new imgSprite());
			super.speed = 35;
			super.damage = 5;
			super.turretName = "Needle Gun Ver1 ";
			super.description = "Anti-air towers."
			super.isTurning = true;
		}
		
		override public function setTargets():void 
		{
			
			AttackPatternFactory.smBox2(this);
			
			
		}
		override public function bulletAnim():void {
			var bullet:NeedleBullet = new NeedleBullet(getTargetAngle(), distance());
			bullet.x = map.size / 2;
			bullet.y = map.size / 2;
			addChild(bullet);
		
		}
		
		public function distance():int{
			var dx:int = this.x - target.x;
			var dy:int = this.y - target.y;
			return Math.sqrt(dx*dx + dy*dy);
		}
		
	}

}