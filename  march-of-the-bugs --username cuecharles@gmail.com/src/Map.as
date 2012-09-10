package  
{
	
	import flash.display.*;
	import flash.events.Event;
	import CreepTypes.*;
	import TurretTypes.*;
	import Maps.LevelValues;
	/**
	 * ...
	 * @author Vali
	 */
	
	/* This class is where everything on the map is drawn.
	 * This also contains functions where things are moved in the map
	 */
	
	public class Map extends Sprite
	{
		[Embed(source = 'Assets/path-var1.png')]
		public var pathImg:Class;
		[Embed(source='Assets/Environment/Tileset/friedChicken.swf', symbol='sampleFood')]
		public var goalImg:Class;
		[Embed(source='Assets/Environment/Tileset/grassbase.jpg')]
		public var grassImg:Class;
		
		public var sGoalImg:Sprite = new goalImg();
		
		//This determines the dimensions of the grid of the map
		public var row:int = 9;	
		public var col:int = 16;	
		
		//This variable is for the resolution of each tile
		public var size:int = 50;
		
		//coordinates of the destination of the creeps
		public var endX:int = 0;
		public var endY:int = 0;
		
		//resource used for making the creeps
		public var resource:int = 1000;
		public var initialResource:int = 1000;
		
		
		//the hp of the thingy the creeps are attacking
		public var hp:int = 50;
		public var maxHP:int = 50;
		
		//layers so sprites will be organized
		public var layer1:Sprite = new Sprite();
		public var layer2:Sprite = new Sprite();
		public var layer3:Sprite = new Sprite();
		public var turretLayer:Sprite = new Sprite();
		public var statLayer:Sprite = new Sprite();
		public var  creepLayer:Sprite = new Sprite();
		
		//This is for the grid of tiles of the map.
		public var tileGrid:Array = new Array();
		
		//array that contains the turrets on the map
		public var turretArray:Array = new Array();
		
		//This array contains all the creeps on the map
		public var creepArray:Array = new Array();
		
		
		//Cooldown for adding creeps
		public var addCreepSpeed:int = 10;
		public var addCreepTime:int = 10;
		
		
		
		public var turretStatBox:TurretStatBox;
		
		
		public function Map(id:int) 
		{
			this.initialResource = LevelValues.initResource[id-1];
			this.maxHP = LevelValues.initLife[id - 1];
			hp = maxHP;
			resource = initialResource;
			
			
			
			Creep.map = this;
			Turret.map = this;
			statLayer.x = 0;
			statLayer.y = 0;			
			
			setLayers();
			drawGrid();
			setTiles();
			
			
			Creep.path = new Array();
			setPath();
			setTurrets();
			setPathImage();
			
			//[42]
			turretStatBox = new TurretStatBox();
			statLayer.addChild(turretStatBox);
			turretStatBox.visible = false;
			addEventListener(Event.REMOVED_FROM_STAGE, destroy);
			
		}
		
		//[42]
		public function setInitialValues(initResource:int, initLives:int):void
		{
			this.initialResource = initResource;
			this.maxHP = initLives;
			
			hp = maxHP;
			
		}
		
		public function setPathImage():void {
			var tile:Tile = this.getTileAt(Creep.spawnX, Creep.spawnY);
			
			tile.addChild(new pathImg());
			
			
			for (var i:int = 0; i < Creep.path.length; i++ ) {
				tile = tile.getTileAt(Creep.path[i]);
				if (tile == null) {
						break;
				}	
					tile.addChild(new pathImg());
					
					// LAST TILE = FOOD
					// TODO: Change the goal food picture into a "collection" of food
					if (i == Creep.path.length - 1)
						tile.addChild(sGoalImg);
				
			}
			
			
		}
		
		//This function is used for the enter frame event
		public function update(e:Event = null):void {
			updateCreeps();
			updateTurrets();
			
			addCreepTime++;
			
			if (addCreepTime > addCreepSpeed) {
				addCreepTime = addCreepSpeed;
			}
			
			//TODO: Add food spoilage animation
			sGoalImg.alpha = hp / maxHP + 0.2;
			
		}
		
		//Executes the update function of each of the turrets
		public function updateTurrets():void {
			
			var turret:Turret;
			var i:int;
			
			for (i = 0; i < turretArray.length; i++ ) {
				turret =turretArray[i];
				turret.update();
			}
			
		}
		
		//Executes the update function of each creep in the creepArray and checks for dead creeps or creeps that have reached the end
		public function updateCreeps():void {
			
			var tile:Tile = getTileAt(endX, endY);
			var i:int = 0
			var creep:Creep;
			
			//For loop to check if there are creeps at the end then removes the creeps
			for (i = 0; i < tile.creepArray.length; i++ ) {
				creep = Creep(tile.creepArray[i]);
				
				
				if (!creep.moving) {
					creep.doDamage();
					removeCreep(creep);
					
				
				}
				
			}
			
			//For loop to update creeps
			for (i= 0; i < creepArray.length; i++ ) {
				creep = Creep(creepArray[i])
				
				if(creep.health > 0){
					creep.update();
				}
				else {
					
					removeCreep(creep);
				}
			}
			
		}
		
		
		//adds a turret at a certain location on the grid of the map
		public function addTurret(xLoc:int, yLoc:int,turretType:Class, direction:uint):void {
			
			getTileAt(xLoc, yLoc).addTurret(turretType, direction);
		}
		
		//This function is for adding a creep to the map
		public function addCreep(creepClass:Class):void {
			
			if(addCreepTime >= addCreepSpeed){
				var creep:Creep = new creepClass();
				if(creep.cost <= this.resource){
					this.resource -= creep.cost;
					creepLayer.addChild(creep);
					creepArray.push(creep);
				}
				addCreepTime = 0;
			}
			
			
		}
		
		//This function is for removing a creep from the map
		public function removeCreep(creep:Creep):void {
			
			//removes the creep from the children of creepLayer
			creepLayer.removeChild(creep);
			
			
			//removes creep from the creepArray of map
			creepArray.splice(creepArray.indexOf(creep), 1);
			
			
			//removes creep from the creepArray of the creep's current tile
			var tile:Tile = getTileAt(creep.xLoc, creep.yLoc)
			tile.creepArray.splice(tile.creepArray.indexOf(creep), 1);
			
			
		}
		
		//[42]
		public function removeAllCreeps():void
		{
			//for (var i:int = 0; i < creepArray.length; i++)
			while(creepArray.length != 0)
			{
				removeCreep(creepArray[creepArray.length-1]);
			}
		}
		
		
		
		// initializes the tiles and addChilds them to the map
		public function setTiles():void {
			
			Tile.size = size;
			Tile.map = this;
			for (var i:int = 0; i < col; i++ ) {
				
				for (var j:int = 0; j < row; j++ ) {
					var tile : Tile = new Tile(i, j);
					var mapImage:Sprite = new Sprite();
					mapImage.addChild(new grassImg());
					tileGrid[i * row + j] = tile;
					layer3.addChild(mapImage);
					mapImage.x = i * this.size;
					mapImage.y = j * this.size;
					layer2.addChild(tileGrid[i*row + j]);
				}
			}
			
			
			
		}
		
		
		//used to get the tile at a locatoin. If tile is out of bounds it returns null.
		public function getTileAt(col:int, row:int):Tile {
		
			if (row < 0 || row >= this.row || col < 0 || col >= this.col) {
				
				return null;
			}
			
			return tileGrid[col * this.row + row];
			
		}
		
		public function setPath():void {
			
		}
		
		public function setTurrets():void{
			
		}
		
		//adds the layers to the map sprites
		public function setLayers():void {
			addChild(layer3);
			addChild(layer1);
			addChild(layer2);
			
			
			addChild(creepLayer);
			addChild(turretLayer);
			addChild(statLayer);
		}
		
		//draws a black grid
		public function drawGrid():void{
			
		
		
			var i:int = 0;
			
			var test:Sprite = new Sprite();
			test.graphics.lineStyle(1);
			
			for (i = 0; i <= row; i++ ){
				test.graphics.moveTo(0, i * size);
				test.graphics.lineTo(col * size, i * size  );
			}
			
			for (i = 0; i <= col; i++ ){
				test.graphics.moveTo(i * size, 0);
				test.graphics.lineTo(i * size, row * size  );
			}
			
			layer1.addChild(test);
		}
		
		public function showTurretStats(turret:Turret):void {
			//turretStatBox = new TurretStatBox(turret);
			//statLayer.addChild(turretStatBox);
			
			//[42]
			turretStatBox.visible = true;
			turretStatBox.updateFields(turret);
		}
		
		public function hideTurretStats():void {
				//statLayer.removeChild(turretStatBox);
				turretStatBox.visible = false;
		}
		
		public function destroy(e:Event):void
		{
			removeEventListener(Event.REMOVED_FROM_STAGE, destroy);
			turretStatBox.destroy();
			turretStatBox = null;
			
			
		}
		
		
	}

}