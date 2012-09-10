package TurretTypes 
{
	/**
	 * ...
	 * @author Vali
	 */
	import BulletTypes.SmashBullet;
	public class ChildrenFeet extends Turret
	{
		[Embed(source = '../Assets/turret/childrensfeetsprite.png')]
		public var imgSprite:Class;
		public function ChildrenFeet(parentTile:Tile, direction:uint) 
		{
			super(parentTile, direction);
			super.sprite.addChild(new imgSprite());
			super.speed = 20;
			super.damage = 10;
			super.turretName = "Children's Feet";
			super.description = "A basic tower."
			super.tileAreaDamage = true;
		}
		
		override public function setTargets():void 
		{
			
			AttackPatternFactory.smBox(this);
			
			
		}
		
		
		override public function bulletAnim():void {
			target.addChild(new SmashBullet());
			
		}
		
	}

}