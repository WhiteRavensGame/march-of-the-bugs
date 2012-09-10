package Maps 
{
	/**
	 * ...
	 * @author JR-kyun
	 */
	import TurretTypes.*;
	public class Level7 extends Map
	{
		//LEVEL 7:
		// Introduce RATS and POWERFUL spray
		
		
		public function Level7() 
		{
			super(7);
		}
		
		override public function setPath():void {
			Creep.spawnX = 15;
			Creep.spawnY = 4;
			
			var path:Array = Creep.path;
			
			path.push(Direction.LEFT);
			path.push(Direction.LEFT);
			path.push(Direction.DOWN);
			path.push(Direction.DOWN);
			path.push(Direction.DOWN);
			path.push(Direction.DOWN);
			path.push(Direction.LEFT);
			path.push(Direction.LEFT);
			path.push(Direction.UP);
			path.push(Direction.UP);
			path.push(Direction.UP);
			path.push(Direction.UP);
			path.push(Direction.UP);
			path.push(Direction.UP);
			path.push(Direction.UP);
			path.push(Direction.UP);
			path.push(Direction.LEFT);
			path.push(Direction.LEFT);
			path.push(Direction.LEFT);
			path.push(Direction.DOWN);
			path.push(Direction.DOWN);
			path.push(Direction.DOWN);
			path.push(Direction.DOWN);
			path.push(Direction.DOWN);
			path.push(Direction.DOWN);
			path.push(Direction.DOWN);
			path.push(Direction.DOWN);
			path.push(Direction.LEFT);
			path.push(Direction.LEFT);
			path.push(Direction.UP);
			path.push(Direction.UP);
			path.push(Direction.UP);
			path.push(Direction.UP);
			path.push(Direction.UP);
			path.push(Direction.UP);
			path.push(Direction.UP);
			path.push(Direction.UP);
			path.push(Direction.LEFT);
			path.push(Direction.LEFT);
			path.push(Direction.LEFT);
			path.push(Direction.DOWN);
			path.push(Direction.DOWN);
			path.push(Direction.DOWN);
			path.push(Direction.DOWN);
			path.push(Direction.DOWN);
			path.push(Direction.DOWN);
			path.push(Direction.DOWN);
			path.push(Direction.DOWN);
			path.push(Direction.LEFT);
			path.push(Direction.LEFT);
			path.push(Direction.LEFT);
			path.push(Direction.UP);
			path.push(Direction.UP);
			path.push(Direction.LEFT);
			
			this.endX = 0;
			this.endY = 6;
		}
		
		override public function setTurrets():void {
			addTurret(12, 7, GroundSpray1, Direction.DOWN);
			addTurret(9, 2, NeedleGun1, Direction.LEFT);
			addTurret(9, 3, NeedleGun1, Direction.LEFT);
			addTurret(9, 4, NeedleGun1, Direction.LEFT);
			addTurret(9, 5, NeedleGun1, Direction.LEFT);
			addTurret(5, 1, GroundSpray1, Direction.UP);
			
			//Below are added by JR
			//
			//addTurret(3, 7, GroundSpray1, Direction.RIGHT);
			//addTurret(5, 4, GroundSpray1, Direction.LEFT);
		}
		
	}

}