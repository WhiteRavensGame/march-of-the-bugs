package Maps 
{
	/**
	 * ...
	 * @author JR-kyun
	 */
	import TurretTypes.*;
	public class Level6 extends Map
	{
		// LEVEL 6
		// Introduce aerial towers
		
		
		public function Level6() 
		{
			super(6);
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
			path.push(Direction.LEFT);
			path.push(Direction.LEFT);
			path.push(Direction.LEFT);
			path.push(Direction.LEFT);
			path.push(Direction.LEFT);
			path.push(Direction.LEFT);
			path.push(Direction.LEFT);
			path.push(Direction.LEFT);
			path.push(Direction.UP);
			path.push(Direction.UP);
			path.push(Direction.UP);
			path.push(Direction.UP);
			path.push(Direction.RIGHT);
			path.push(Direction.RIGHT);
			path.push(Direction.RIGHT);
			path.push(Direction.RIGHT);
			path.push(Direction.RIGHT);
			path.push(Direction.RIGHT);
			path.push(Direction.RIGHT);
			path.push(Direction.UP);
			path.push(Direction.UP);
			path.push(Direction.UP);
			path.push(Direction.UP);
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
			this.endY = 0;
			
		}
		
		override public function setTurrets():void {
			
			addTurret(12, 7, ChildFoot, Direction.DOWN);
			addTurret(9, 7, NeedleGun1, Direction.DOWN);
			addTurret(6, 7, NeedleGun1, Direction.DOWN);
			addTurret(4, 5, ChildrenFeet, Direction.LEFT);
			addTurret(9, 2, ChildFoot, Direction.RIGHT);
			addTurret(8, 1, NeedleGun1, Direction.UP);
			//addTurret(5, 2, NeedleGun1, Direction.UP);
			
			//Below are added by JR
			
			//addTurret(11, 2, ChildFoot, Direction.LEFT);
			//addTurret(2, 6, NeedleGun1, Direction.RIGHT);
			//addTurret(3, 1, NeedleGun1, Direction.UP);
			
		}
		
	}

}