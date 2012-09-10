package TurretTypes 
{
	/**
	 * ...
	 * @author JR-kyun
	 */
	public class BugZapper1 extends Turret
	{
		
		public function BugZapper1(parentTile:Tile, direction:uint) 
		{
			super(parentTile, direction);
			super.speed = 30;
			super.damage =  7;
			super.turretName = "Bug Zapper Ver 1";
			super.description = "A tower that electroucutes bugs until nothing is left";
			//super.isTurning = true ... Depends on art
		}
		
		override public function setTargets():void
		{
			AttackPatternFactory.smCross(this);
		}
	}

}