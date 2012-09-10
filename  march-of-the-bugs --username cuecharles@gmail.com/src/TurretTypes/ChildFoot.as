package TurretTypes 
{
	import BulletTypes.SmashBullet;
	/**
	 * ...
	 * @author Vali
	 */
	public class ChildFoot extends Turret
	{
		[Embed(source = '../Assets/turret/childsfootsprite.png')]
		public var imgSprite:Class;
		public function ChildFoot(parentTile:Tile, direction:uint) 
		{
			super(parentTile, direction);
			super.sprite.addChild(new imgSprite());
			super.speed = 40;
			super.damage = 10;
			super.turretName = "Child's Foot";
			super.description = "A basic tower."
			super.tileAreaDamage = true;
		}
		override public function setTargets():void 
		{
			
			AttackPatternFactory.smTriangle(this);
			
			
		}
		
		
		
		override public function bulletAnim():void {
			target.addChild(new SmashBullet());
		}
		
	}

}