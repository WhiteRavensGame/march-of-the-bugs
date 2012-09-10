package TurretTypes 
{
	/**
	 * ...
	 * @author Vali
	 */
	public class StrongTurret extends Turret
	{
		[Embed(source = '../Assets/strongTurret.png')]
		public var imgTurret:Class;
		public function StrongTurret(parentTile:Tile, direction:uint) 
		{
			
			
			super(parentTile,direction);
			sprite.addChild(new imgTurret());
			super.speed = 90;
			super.damage = 90;
			super.turretName = "Strong";
			super.description = "A tower known to rival the strength of a certain Kryptonian super hero.";
			super.isTurning = true;
			
		}
		
		
		override public function setTargets():void 
		{
			
			AttackPatternFactory.smBox(this);
			
			
		}
		
	}

}