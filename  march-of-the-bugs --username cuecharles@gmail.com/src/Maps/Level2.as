package Maps 
{
	/**
	 * ...
	 * @author JR-kyun
	 */
	import TurretTypes.*;
	public class Level2 extends Map
	{
		
		// LEVEL 2
		// Introduce towers
		
		public function Level2() 
		{
			super(2);
		}
		
		override public function setPath():void {
			Creep.spawnX = 15;
			Creep.spawnY = 4;
			
			var path:Array = Creep.path;
			
			path.push(Direction.LEFT);
			path.push(Direction.LEFT);
			path.push(Direction.LEFT);
			path.push(Direction.DOWN);
			path.push(Direction.DOWN);
			path.push(Direction.DOWN);
			path.push(Direction.LEFT);
			path.push(Direction.LEFT);
			path.push(Direction.LEFT);
			path.push(Direction.LEFT);
			path.push(Direction.LEFT);
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
			path.push(Direction.LEFT);
			path.push(Direction.LEFT);
			
			this.endX = 0;
			this.endY = 1;
			}
			
		override public function setTurrets():void {
			addTurret(11, 6, ChildFoot, Direction.DOWN);
			addTurret(4, 2, ChildFoot, Direction.UP);
			//Below are added by JR
			//addTurret(6, 4, ChildFoot, Direction.RIGHT); 
			//addTurret(13, 3, ChildFoot, Direction.DOWN);
		}
		
	}

}