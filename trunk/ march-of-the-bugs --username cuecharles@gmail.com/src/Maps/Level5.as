package Maps 
{
	/**
	 * ...
	 * @author JR-kyun
	 */
	import TurretTypes.*;
	public class Level5 extends Map
	{
		//LEVEL 5
		// Introduce flying enemy
		
		public function Level5() 
		{
			super(5);
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
			path.push(Direction.LEFT);
			path.push(Direction.LEFT);
			path.push(Direction.DOWN);
			path.push(Direction.DOWN);
			path.push(Direction.DOWN);
			path.push(Direction.DOWN);
			path.push(Direction.RIGHT);
			path.push(Direction.DOWN);
			path.push(Direction.DOWN);
			path.push(Direction.DOWN);
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
			addTurret(14, 3, ChildrenFeet, Direction.DOWN);
			addTurret(12, 7, ChildrenFeet, Direction.RIGHT);
			addTurret(11, 1, ChildrenFeet, Direction.LEFT);
			addTurret(11, 4, ChildrenFeet, Direction.LEFT);
			addTurret(6, 0, ChildrenFeet, Direction.LEFT);
			addTurret(4, 2, ChildFoot, Direction.LEFT);
			addTurret(6, 4, ChildrenFeet, Direction.LEFT);
			addTurret(4, 5, ChildrenFeet, Direction.LEFT);
			addTurret(7, 6, ChildrenFeet, Direction.LEFT);
			addTurret(4, 7, ChildFoot, Direction.DOWN);
			addTurret(2, 7, ChildFoot, Direction.DOWN);
			
			//Below are added by JR
			
			addTurret(8, 2, ChildrenFeet, Direction.UP);
			addTurret(14, 6, ChildFoot, Direction.LEFT);
		}
		
	}

}