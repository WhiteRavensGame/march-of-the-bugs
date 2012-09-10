package  
{
	/**
	 * ...
	 * @author Vali
	 */
	/*
	 * This class is used to produce attack patterns of the turrets 
	 */
	public class AttackPatternFactory
	{
		
		public function AttackPatternFactory() 
		{
			
		}
		
		public static function smCross(turret:Turret):void {
			
			turret.targetTiles.push(turret.parentTile.getTileAt(Direction.UP));
			turret.targetTiles.push(turret.parentTile.getTileAt(Direction.DOWN));
			turret.targetTiles.push(turret.parentTile.getTileAt(Direction.LEFT));
			turret.targetTiles.push(turret.parentTile.getTileAt(Direction.RIGHT));
			turret.targetTiles.push(turret.parentTile);
			turret.targetTiles = turret.targetTiles.filter(turret.filterNull);
		}
		
		public static function smBox(turret:Turret):void{
		
			var map:Map = Turret.map;
		
			turret.targetTiles.push(map.getTileAt(turret.parentTile.col + 1, turret.parentTile.row + 1));
			turret.targetTiles.push(map.getTileAt(turret.parentTile.col - 1, turret.parentTile.row - 1));
			turret.targetTiles.push(map.getTileAt(turret.parentTile.col + 1, turret.parentTile.row -1));
			turret.targetTiles.push(map.getTileAt(turret.parentTile.col - 1, turret.parentTile.row + 1));
			
			AttackPatternFactory.smCross(turret);
		}
		
		public static function smTriangle(turret:Turret):void {
			var map:Map = Turret.map;
			switch(turret.direction) {
				case Direction.UP:
					turret.targetTiles.push(turret.parentTile.getTileAt(Direction.UP));
					turret.targetTiles.push(map.getTileAt(turret.parentTile.col - 1, turret.parentTile.row - 1));
					turret.targetTiles.push(map.getTileAt(turret.parentTile.col + 1, turret.parentTile.row -1));
					break;
				case Direction.RIGHT:
					turret.targetTiles.push(turret.parentTile.getTileAt(Direction.RIGHT));
					turret.targetTiles.push(map.getTileAt(turret.parentTile.col + 1, turret.parentTile.row - 1));
					turret.targetTiles.push(map.getTileAt(turret.parentTile.col + 1, turret.parentTile.row +1));
					break;
				case Direction.LEFT:
					turret.targetTiles.push(turret.parentTile.getTileAt(Direction.LEFT));
					turret.targetTiles.push(map.getTileAt(turret.parentTile.col - 1, turret.parentTile.row - 1));
					turret.targetTiles.push(map.getTileAt(turret.parentTile.col - 1, turret.parentTile.row +1));
					break;
				case Direction.DOWN:
					turret.targetTiles.push(turret.parentTile.getTileAt(Direction.DOWN));
					turret.targetTiles.push(map.getTileAt(turret.parentTile.col - 1, turret.parentTile.row + 1));
					turret.targetTiles.push(map.getTileAt(turret.parentTile.col + 1, turret.parentTile.row +1));
					break;
				
			}
			
			turret.targetTiles = turret.targetTiles.filter(turret.filterNull);
		}
		
		public static function smBox2(turret:Turret):void{
		
			var map:Map = Turret.map;
		
			turret.targetTiles.push(map.getTileAt(turret.parentTile.col + 2, turret.parentTile.row + 2));
			turret.targetTiles.push(map.getTileAt(turret.parentTile.col - 2, turret.parentTile.row - 2));
			turret.targetTiles.push(map.getTileAt(turret.parentTile.col + 2, turret.parentTile.row -2));
			turret.targetTiles.push(map.getTileAt(turret.parentTile.col - 2, turret.parentTile.row + 2));
			
			turret.targetTiles.push(map.getTileAt(turret.parentTile.col + 1, turret.parentTile.row + 2));
			turret.targetTiles.push(map.getTileAt(turret.parentTile.col - 1, turret.parentTile.row - 2));
			turret.targetTiles.push(map.getTileAt(turret.parentTile.col + 1, turret.parentTile.row -2));
			turret.targetTiles.push(map.getTileAt(turret.parentTile.col - 1, turret.parentTile.row + 2));
			
			turret.targetTiles.push(map.getTileAt(turret.parentTile.col + 2, turret.parentTile.row + 1));
			turret.targetTiles.push(map.getTileAt(turret.parentTile.col - 2, turret.parentTile.row - 1));
			turret.targetTiles.push(map.getTileAt(turret.parentTile.col + 2, turret.parentTile.row -1));
			turret.targetTiles.push(map.getTileAt(turret.parentTile.col - 2, turret.parentTile.row + 1));
			
			turret.targetTiles.push(map.getTileAt(turret.parentTile.col, turret.parentTile.row + 2));
			turret.targetTiles.push(map.getTileAt(turret.parentTile.col, turret.parentTile.row - 2));
			turret.targetTiles.push(map.getTileAt(turret.parentTile.col + 2, turret.parentTile.row));
			turret.targetTiles.push(map.getTileAt(turret.parentTile.col - 2, turret.parentTile.row));
			
			AttackPatternFactory.smBox(turret);
		}
		
		
		public static function linear(turret:Turret):void {
			var map:Map = Turret.map;
			
			switch(turret.direction) {
				case Direction.UP:
					turret.targetTiles.push(turret.parentTile.getTileAt(Direction.UP));
					turret.targetTiles.push(map.getTileAt(turret.parentTile.col, turret.parentTile.row - 2));
					break;
				case Direction.RIGHT:
					turret.targetTiles.push(turret.parentTile.getTileAt(Direction.RIGHT));
					turret.targetTiles.push(map.getTileAt(turret.parentTile.col + 2, turret.parentTile.row));
					break;
				case Direction.LEFT:
					turret.targetTiles.push(turret.parentTile.getTileAt(Direction.LEFT));
					turret.targetTiles.push(map.getTileAt(turret.parentTile.col - 2, turret.parentTile.row));
					break;
				case Direction.DOWN:
					turret.targetTiles.push(turret.parentTile.getTileAt(Direction.DOWN));
					turret.targetTiles.push(map.getTileAt(turret.parentTile.col, turret.parentTile.row + 2));
					break;
				
			}
			
			turret.targetTiles = turret.targetTiles.filter(turret.filterNull);
			
		}
		
		public static function linear2(turret:Turret):void {
			var map:Map = Turret.map;
			switch(turret.direction) {
				case Direction.UP:
					turret.targetTiles.push(map.getTileAt(turret.parentTile.col, turret.parentTile.row - 3));
					break;
				case Direction.RIGHT:
					turret.targetTiles.push(map.getTileAt(turret.parentTile.col + 3, turret.parentTile.row));
					break;
				case Direction.LEFT:
					turret.targetTiles.push(map.getTileAt(turret.parentTile.col - 3, turret.parentTile.row));
					break;
				case Direction.DOWN:
					turret.targetTiles.push(map.getTileAt(turret.parentTile.col, turret.parentTile.row + 3));
					break;
				
			}
			
			AttackPatternFactory.linear(turret);
		}
	}

}