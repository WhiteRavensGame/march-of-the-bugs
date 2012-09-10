package TurretTypes 
{
	/**
	 * ...
	 * @author Vali
	 */
	public class BasicTurret extends Turret
	{
		
		[Embed(source='../Assets/testTurret.png')]
		public var imgTurret:Class;
		
		public function BasicTurret(parentTile:Tile,direction:uint) 
		{
			
			
			super(parentTile, direction);
			sprite.addChild(new imgTurret());
			super.speed = 18;
			super.turretName = "Basic";
			super.description = "A basic tower."
		}
		
		
		
	}

}