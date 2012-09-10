package TurretTypes 
{
	/**
	 * ...
	 * @author JR-kyun
	 */
	public class FireCrackers1 extends Turret
	{
		
		public function FireCrackers1() 
		{
			super(parentTile, direction);
			super.speed = 75;
			super.damage =  3;
			super.turretName = "Fire Crackers Ver 1";
			super.description = "Example of another use of fire-crackers ";
			//super.isTurning = true ... Depends on art
		}
		
		override public function setTargets():void
		{
			AttackPatternFactory.smBox(this);
		}
		
	}

}