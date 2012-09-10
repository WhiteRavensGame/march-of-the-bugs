package Maps 
{
	/**
	 * ...
	 * @author JR-kyun
	 */
	import TurretTypes.*;
	
	public class Level10 extends Map
	{
		
		public function Level10() 
		{
			super(10);
		}
		
		override public function setPath(): void {
			Creep.spawnX = 15;
			Creep.spawnY = 1;
			
			var path:Array = Creep.path;
			
			path.push(Direction.LEFT);
			path.push(Direction.LEFT);
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
			path.push(Direction.LEFT);
			path.push(Direction.LEFT);
			path.push(Direction.DOWN);
			path.push(Direction.DOWN);
			path.push(Direction.RIGHT);
			path.push(Direction.RIGHT);
			path.push(Direction.RIGHT);
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
			path.push(Direction.RIGHT);
			path.push(Direction.RIGHT);
			path.push(Direction.DOWN);
			path.push(Direction.DOWN);
			path.push(Direction.LEFT);
			path.push(Direction.LEFT);
			path.push(Direction.LEFT);
			path.push(Direction.LEFT);
			
			this.endX = 0;
			this.endY = 8;
		}
		
		override public function setTurrets():void {
			addTurret(12, 1, NeedleGun1, Direction.RIGHT);
			addTurret(11, 1, ChildrenFeet, Direction.UP);
			addTurret(3, 1, ChildrenFeet, Direction.DOWN);
			addTurret(2, 1, NeedleGun1, Direction.LEFT);
			addTurret(13, 3, NeedleGun1, Direction.RIGHT);
			addTurret(11, 5, NeedleGun1, Direction.RIGHT);
			addTurret(14, 7, GroundSpray1, Direction.RIGHT);
			addTurret(8, 7, NeedleGun1, Direction.DOWN);
			addTurret(6, 3, ChildFoot, Direction.DOWN);
			addTurret(3, 7, GroundSpray1, Direction.LEFT);
			//addTurret(2, 7, ChildrenFeet, Direction.RIGHT);
			
			//Below are added by JR
			addTurret(7, 1, GroundSpray1, Direction.UP);
			addTurret(13, 5, GroundSpray1, Direction.DOWN);
			//addTurret(3, 5, GroundSpray1, Direction.DOWN);
			
			
		}
		
	}

}