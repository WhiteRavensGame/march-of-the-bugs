package TurretTypes 
{
	import BulletTypes.SprayBullet;
	/**
	 * ...
	 * @author Vali
	 */
	public class GroundSpray1 extends Turret
	{
		[Embed(source = '../Assets/turret/bugspraysprite.png')]
		public var imgSprite:Class;
		public function GroundSpray1(parentTile:Tile, direction:uint) 
		{
			super(parentTile, direction);
			super.sprite.addChild(new imgSprite());
			super.speed = 205;
			super.damage = 50;
			super.turretName = "Ground Spray Ver1 ";
			super.description = "A tower that HURTS, but takes a while to recharge."
			super.isTurning = true;
			super.tileAreaDamage = true;
		}
		override public function setTargets():void 
		{
			
			AttackPatternFactory.smCross(this);
			
			
		}
		
		override public function bulletAnim():void {
			var bullet:SprayBullet = new SprayBullet(getTargetAngle());
			bullet.x = map.size / 2;
			bullet.y = map.size / 2;
			this.addChild(bullet);
			
		}
		
	}

}