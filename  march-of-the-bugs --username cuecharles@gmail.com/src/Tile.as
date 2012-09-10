package  
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import flash.text.*
	/**
	 * ...
	 * @author Vali
	 */
	public class Tile extends Sprite
	{
		public static var size:int = 0;
		public var col:int;
		public var row:int;
		
		//list of creeps current on the array
		public var creepArray:Array = new Array();
		
		public static var map:Map;
		
		/*
		 * This class is the tiles of the map. This class is extended into the turret class.
		 * This will always where code for highlighting tiles go.
		 */
		public function Tile(col:int, row:int) 
		{
			this.row = row;
			this.col = col;
			x =  col* size;
			y = row * size;
			
		/*	var white:Sprite = new Sprite();
			white.graphics.beginFill(0x000000, 0);
			white.graphics.drawRect(0, 0, map.size, map.size);
			addChild(white);
			
			addEventListener(MouseEvent.ROLL_OVER, highlight);
			addEventListener(MouseEvent.ROLL_OUT, clearGprahics);*/
			
			
			
		}
		
		//highlights the tile
		public function highlight():void {
			 
			graphics.beginFill(0xffffff, .3);
			graphics.drawRect(0, 0, map.size, map.size);
			
		}
		
		//removes the graphics currently on the tile
		public function clearGprahics():void {
			graphics.clear();
		}
		
		
		//adds a turret to this tile
		public function addTurret(turretType:Class, direction:uint):void {
			
			var turret:Turret = new turretType(this, direction);
			
			map.turretArray.push(turret);
			map.turretLayer.addChild(turret);

			
		}
		
		public function drawBorder(direction:uint):void {
			var startX:int = 0;
			var startY:int = 0;
			var destX:int = 0;
			var destY:int = 0;
			
			graphics.lineStyle(1, 0xff0000);
			
			switch(direction){
				case Direction.UP:
				destX = map.size;
					break;
				case Direction.DOWN:
				startY = map.size;
				destX = map.size;
				destY =  map.size
					break;
				case Direction.RIGHT:
				startX = map.size;
				destX = map.size;
				destY = map.size;
					break;
				case Direction.LEFT:
				destY = map.size;
					break;
			}
			graphics.moveTo(startX, startY);
			
			graphics.lineTo(destX,destY);
			
			
		}
		
		
		//Draws the coordintaes of the tile to the tile
		public function drawCoordinates():void {
			var testField:TextField = new TextField();
			testField.text = col.toString() +", " + row.toString();
			addChild(testField);
			
		}
		
		//returns the tile at locations above, below, left or right of the object tile in relation to the grid
		public function getTileAt(direction:uint):Tile {
			
			switch(direction) {
				case Direction.UP:
					return map.getTileAt(col, row - 1);
					break;
				case Direction.DOWN:
					return map.getTileAt(col, row + 1);
					break;
				case Direction.LEFT:
					return map.getTileAt(col - 1, row);
					break;
				case Direction.RIGHT:
					return map.getTileAt(col + 1, row);
					break;
			}
			
			return null;
		}
		
		
	}

}