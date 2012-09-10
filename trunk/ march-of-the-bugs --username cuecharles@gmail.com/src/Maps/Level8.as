package Maps 
{
	/**
	 * ...
	 * @author JR-kyun
	 */
	import TurretTypes.*;
	
	public class Level8 extends Map
	{
		// LEVEL 8
		// Time to play! 
		
		public function Level8() 
		{
			super(8);
		}
		
		override public function setPath():void {
			Creep.spawnX = 15;
			Creep.spawnY = 4;
			
			var path:Array = Creep.path;
			
			path.push(Direction.LEFT);
			path.push(Direction.LEFT);
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
			path.push(Direction.LEFT);
			path.push(Direction.LEFT);
			path.push(Direction.DOWN);
			path.push(Direction.DOWN);
			path.push(Direction.DOWN);
			path.push(Direction.DOWN);
			path.push(Direction.RIGHT);
			path.push(Direction.RIGHT);
			path.push(Direction.RIGHT);
			path.push(Direction.RIGHT);
			path.push(Direction.RIGHT);
			path.push(Direction.UP);
			path.push(Direction.RIGHT);
			path.push(Direction.RIGHT);
			path.push(Direction.RIGHT);
			path.push(Direction.RIGHT);
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
			path.push(Direction.LEFT);
			path.push(Direction.LEFT);
			path.push(Direction.DOWN);
			path.push(Direction.DOWN);
			path.push(Direction.LEFT);
			path.push(Direction.LEFT);
			path.push(Direction.LEFT);
			
			this.endX = 0;
			this.endY = 8;
		}
		
		override public function setTurrets():void {
			//addTurret(14, 3, ChildFoot, Direction.DOWN);
			//addTurret(14, 1, ChildFoot, Direction.LEFT);
			//addTurret(4, 1, ChildFoot, Direction.UP);
			addTurret(7, 1, ChildFoot, Direction.UP);
			addTurret(2, 1, NeedleGun1, Direction.LEFT);
			addTurret(2, 2, NeedleGun1, Direction.LEFT);
			addTurret(2, 3, NeedleGun1, Direction.LEFT);
			//addTurret(7, 2, ChildFoot, Direction.DOWN);
			addTurret(10, 2, ChildFoot, Direction.DOWN);
			addTurret(10, 4, NeedleGun1, Direction.RIGHT);
			//addTurret(10, 5, NeedleGun1, Direction.RIGHT);
			//addTurret(7, 5, ChildFoot, Direction.DOWN);
			addTurret(4, 5, ChildrenFeet, Direction.DOWN);
			
			//Below are added by JR
			
			addTurret(2, 7, GroundSpray1, Direction.DOWN);
			addTurret(12, 1, GroundSpray1, Direction.UP);
			
		}
		
	}

}