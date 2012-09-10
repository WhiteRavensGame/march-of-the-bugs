package Maps 
{
	/**
	 * ...
	 * @author JR-kyun
	 */
	import TurretTypes.*;
	public class Level3 extends Map
	{
		
		//LEVEL 3
		//Introduce life of creeps
		
		public function Level3() 
		{
			super(3);
		}
		
		override public function setPath():void {
			Creep.spawnX = 15;
			Creep.spawnY = 8;
			
			var path:Array = Creep.path;
			
			path.push(Direction.LEFT);
			path.push(Direction.LEFT);
			path.push(Direction.LEFT);
			path.push(Direction.LEFT);
			path.push(Direction.LEFT);
			path.push(Direction.LEFT);
			path.push(Direction.UP);
			path.push(Direction.UP);
			path.push(Direction.UP);
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
			path.push(Direction.LEFT);
			path.push(Direction.LEFT);
			
			this.endX = 0;
			this.endY = 1;
		}
		
		override public function setTurrets():void {
			addTurret(12, 7, ChildFoot, Direction.DOWN);
			addTurret(9, 2, ChildFoot, Direction.UP);
			//addTurret(6, 2, ChildFoot, Direction.UP);
			
			//Below are added by JR
			
			addTurret(13, 3, ChildFoot, Direction.LEFT);
			addTurret(8, 6, ChildFoot, Direction.RIGHT);
			addTurret(2, 0, ChildFoot, Direction.DOWN);
		}
	}

}