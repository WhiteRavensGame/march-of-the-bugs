package  
{
	/**
	 * ...
	 * @author Vali
	 */
	/*
	 * Class used to generate maps
	 */
	
	import TurretTypes.*;
	public class MapFactory
	{
		
		public function MapFactory() 
		{
			
		}
		
		public static function map1(map:Map):void {
		
			map.addTurret(2, 4, NeedleGun1, Direction.RIGHT);
			
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
		}
		
		public static function map2(map:Map):void {
			map.addTurret(5, 6, BasicTurret, Direction.DOWN);
			map.addTurret(2, 5, BasicTurret, Direction.RIGHT);
			map.addTurret(2, 2, BasicTurret, Direction.RIGHT);
			map.addTurret(4, 3, BasicTurret, Direction.RIGHT);
			map.addTurret(8, 8, BasicTurret, Direction.RIGHT);
			map.addTurret(10, 7, BasicTurret, Direction.RIGHT);
			map.addTurret(10, 4, StrongTurret, Direction.RIGHT);
			map.addTurret(7, 4, StrongTurret, Direction.RIGHT);
			map.addTurret(4, 1, StrongTurret, Direction.RIGHT);
			
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
		}
		
	}

}