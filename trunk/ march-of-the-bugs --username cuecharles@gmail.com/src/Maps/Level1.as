package Maps 
{
	/**
	 * ...
	 * @author JR-kyun
	 */
	
	import TurretTypes.*;
	public class Level1 extends Map
	{
		// LEVEL 1
		// Introduce basic controls and mechanics
		
		public function Level1() 
		{
			super(1);
			
			
		}
			override public function setPath():void {
			Creep.spawnX =15;
			Creep.spawnY = 4;
			
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
			path.push(Direction.UP);
			path.push(Direction.UP);
			path.push(Direction.LEFT);
			path.push(Direction.LEFT);
			path.push(Direction.LEFT);
			path.push(Direction.LEFT);
			path.push(Direction.LEFT);
			path.push(Direction.LEFT);
			
			this.endX = 0;
			this.endY = 2;
		}
	}
}