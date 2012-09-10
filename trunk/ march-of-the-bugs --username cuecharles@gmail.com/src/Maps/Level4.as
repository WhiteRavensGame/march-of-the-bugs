package Maps 
{
	/**
	 * ...
	 * @author JR-kyun
	 */
	
	import TurretTypes.*;
	public class Level4 extends Map
	{
		// LEVEL 4
		// Introduce strategy. Spread shot kills, so send out carefully
		
		public function Level4() 
		{
			super(4);
		}
		
		override public function setPath():void {
			Creep.spawnX = 15;
			Creep.spawnY = 4;
			var path:Array = Creep.path;
			
			path.push(Direction.LEFT);
			path.push(Direction.LEFT);
			path.push(Direction.LEFT);
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
			path.push(Direction.DOWN);
			path.push(Direction.DOWN);
			path.push(Direction.DOWN);
			path.push(Direction.DOWN);
			path.push(Direction.DOWN);
			path.push(Direction.RIGHT);
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
			addTurret(11, 2, ChildrenFeet, Direction.UP);
			addTurret(4, 2, ChildrenFeet, Direction.RIGHT);
			
			//addTurret(8, 2, ChildrenFeet, Direction.DOWN);
			//Below are added by JR
			
			
			addTurret(5, 7, ChildrenFeet, Direction.DOWN);
		}
		
	}

}