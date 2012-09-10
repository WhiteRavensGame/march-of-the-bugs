package Maps 
{
	/**
	 * ...
	 * @author Vali
	 */
	import TurretTypes.*;
	public class Map2 extends Map
	{
		
		public function Map2() 
		{
			super();
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
			path.push(Direction.UP);
			path.push(Direction.UP);
			path.push(Direction.LEFT);
			path.push(Direction.LEFT);
			path.push(Direction.LEFT);
			
			this.endX = 0;
			this.endY = 0;
		}
		
		override public function setTurrets():void {
			addTurret(5, 6, BasicTurret, Direction.DOWN);
			addTurret(2, 5, BasicTurret, Direction.RIGHT);
			addTurret(2, 2, BasicTurret, Direction.RIGHT);
			addTurret(4, 3, BasicTurret, Direction.RIGHT);
			addTurret(8, 8, BasicTurret, Direction.RIGHT);
			addTurret(10, 7, BasicTurret, Direction.RIGHT);
			addTurret(10, 4, StrongTurret, Direction.RIGHT);
			addTurret(7, 4, StrongTurret, Direction.RIGHT);
			addTurret(4, 1, StrongTurret, Direction.RIGHT);
		}
		
	}

}