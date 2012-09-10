package Maps 
{
	/**
	 * ...
	 * @author JR-kyun
	 */
	import TurretTypes.*;
	
	public class Level9 extends Map
	{
		
		// LEVEL 9
		// Strategize
		
		public function Level9() 
		{
			super(9);
		}
		
		override public function setPath():void {
			Creep.spawnX = 15;
			Creep.spawnY = 0;
			
			var path:Array = Creep.path;
			
			path.push(Direction.LEFT);
			path.push(Direction.LEFT);
			path.push(Direction.LEFT);
			path.push(Direction.LEFT);
			path.push(Direction.LEFT);
			path.push(Direction.LEFT);
			path.push(Direction.LEFT);
			path.push(Direction.LEFT);
			path.push(Direction.LEFT);
			path.push(Direction.LEFT);
			path.push(Direction.LEFT);
			path.push(Direction.LEFT);
			path.push(Direction.LEFT);
			path.push(Direction.DOWN);
			path.push(Direction.DOWN);
			path.push(Direction.DOWN);
			path.push(Direction.RIGHT);
			path.push(Direction.RIGHT);
			path.push(Direction.RIGHT);
			path.push(Direction.RIGHT);
			path.push(Direction.RIGHT);
			path.push(Direction.RIGHT);
			path.push(Direction.RIGHT);
			path.push(Direction.RIGHT);
			path.push(Direction.RIGHT);
			path.push(Direction.RIGHT);
			path.push(Direction.RIGHT);
			path.push(Direction.RIGHT);
			path.push(Direction.RIGHT);
			path.push(Direction.DOWN);
			path.push(Direction.DOWN);
			path.push(Direction.DOWN);
			path.push(Direction.DOWN);
			path.push(Direction.DOWN);
			path.push(Direction.LEFT);
			path.push(Direction.LEFT);
			path.push(Direction.LEFT);
			path.push(Direction.LEFT);
			path.push(Direction.LEFT);
			path.push(Direction.LEFT);
			path.push(Direction.LEFT);
			path.push(Direction.LEFT);
			path.push(Direction.LEFT);
			path.push(Direction.LEFT);
			path.push(Direction.LEFT);
			path.push(Direction.LEFT);
			path.push(Direction.LEFT);
			path.push(Direction.LEFT);
			path.push(Direction.LEFT);
			
			this.endX = 0;
			this.endY = 8;
			
		}
		
		override public function setTurrets():void {
			addTurret(13, 1, NeedleGun1, Direction.UP);
			addTurret(3, 1, GroundSpray1, Direction.LEFT);
			addTurret(4, 2, NeedleGun1, Direction.DOWN);
			addTurret(11, 2, ChildrenFeet, Direction.DOWN);
			addTurret(14, 5, NeedleGun1, Direction.RIGHT);
			addTurret(14, 7, GroundSpray1, Direction.DOWN);
			addTurret(11, 7, NeedleGun1, Direction.DOWN);
			addTurret(5, 7, ChildrenFeet, Direction.DOWN);
			addTurret(2, 7, NeedleGun1, Direction.DOWN);
			
			//Below are added by JR
			
			addTurret(8, 4, GroundSpray1, Direction.UP);
		}
		
	}

}