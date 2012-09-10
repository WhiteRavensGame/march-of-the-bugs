package TurretTypes 
{
	/**
	 * ...
	 * @author JR-kyun
	 */
	public class LegCrusher1 extends Turret
	{
		
		public function LegCrusher1(parentTile:Tile, direction:uint) 
		{
			super(parentTile, direction);
			super.speed = 60;
			super.damage =  11;
			super.turretName = "Leg Crusher Ver 1";
			super.description = "A BIG foot with the sole purpose of crushing its targets";
			//super.isTurning = true ... Depends on art
		}
		
		override public function setTargets():void
		{
			AttackPatternFactory.smBox(this);
		}
	}

}