package  
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Matrix;
	/**
	 * ...
	 * @author Vali
	 */
	
	/*
	 * The creep. Things that the towers will shoot at.
	 */
	

	public class Creep extends Sprite
	{
		//static variable of the map for the creep class. This is always initialized in the contructor of the map class
		public static var map:Map;
		
		//Boolean flag that is for the animation of movement from one cell to another. This is to determine whether the
		//Creep is currently performing the movement animation or not.
		public var moving:Boolean = false;
		
		//variable that determine on which direction the creep should go in the grid
		public var direction:uint = Direction.UP;
		
		
		//pathProg is used to keep track of progress on the path execution
		//path is the list of moves to be executed
		public var pathProg:int = 0;
		static public var path:Array = new Array();
		
		
		//These variable are the coordinates of the creep within the grid of the map
		public var xLoc:int = 0;
		public var yLoc:int = 0;
		
		//Determines the starting point of the creeps
		static public var spawnX:int;
		static public var spawnY:int;
		
		//This variable determines the movement animation speed of the Creep.
		public var moveMod:int = 10;
		
		//Health of teh creep
		public var health:int = 100;
		
		//actual full health
		public var fullHealth:int = 100;
		
		//damage that the creep does to the thingy
		public var damage:int = 1;
		
		//healthbar sprite and property vars
		public var healthBar:Sprite = new Sprite();
		public var barHeight:int = 3;
		
		
		//cost to spawn the creep
		public var cost:int = 1;
		
		
		//Determines whether creep is ground type or flying type
		public var isFlying:Boolean = false;
		
		
		//damage multiplier
		public var dmgMult:DamageMultiplier = new DamageMultiplier();
		
		
		public var sprite:Sprite = new Sprite();
		
	
		
		public function Creep(health:int, moveMod:int) 
		{
			this.xLoc = spawnX;
			this.yLoc = spawnY;
			
			this.x = xLoc * map.size;
			this.y = yLoc * map.size;
			
			this.health = health;
			fullHealth = health;
			this.moveMod = moveMod;
			addChild(sprite);
			addChild(healthBar);
			healthBar.y = map.size - barHeight;
			drawHealthBar();
			
			
			//This line adds the creep to the enemy list of it's initial tile
			map.getTileAt(xLoc, yLoc).creepArray.push(this);
			
			
			
	
		}
		
		//This function is for the enter_frame event
		public function update(e:Event = null):void {
			
			if (moving){
				move();
			}
			else{
				
				followPath();
				
			}
		}
		
		//function that executes the predetermined path given to the creep
		public function followPath():void {
			if (pathProg < path.length) {
				
				setDirection(path[pathProg])
				pathProg++;
			}
			
		}
		
		//makes the creep go to a direction from its current tile only if the creep is not in a moving animation
		public function setDirection(direction:uint):void {
			if(!this.moving){
				switch(direction) {
					case Direction.UP:
						if (map.getTileAt(xLoc, yLoc - 1) != null) {
							this.direction = Direction.UP;
							this.moving = true
							face(Direction.UP);
							
							//This line of code removes the creep from its previous tile's creepArray
							map.getTileAt(xLoc, yLoc).creepArray.splice(map.getTileAt(xLoc, yLoc).creepArray.indexOf(this), 1);
							yLoc--;
							//This line adds it's new tile
							map.getTileAt(xLoc, yLoc).creepArray.push(this);
						}
						
						break;
					case Direction.DOWN:
						if (map.getTileAt(xLoc, yLoc + 1) != null) {
							this.direction = Direction.DOWN;
							this.moving = true;
							face(Direction.DOWN);
							map.getTileAt(xLoc, yLoc).creepArray.splice(map.getTileAt(xLoc, yLoc).creepArray.indexOf(this), 1);
							yLoc++;
							map.getTileAt(xLoc, yLoc).creepArray.push(this);
						}
						
						break;
					case Direction.LEFT:
						if (map.getTileAt(xLoc - 1, yLoc) != null) {
							this.direction = Direction.LEFT;
							this.moving = true;
							face(Direction.LEFT);
							map.getTileAt(xLoc, yLoc).creepArray.splice(map.getTileAt(xLoc, yLoc).creepArray.indexOf(this), 1);
							xLoc--;
							map.getTileAt(xLoc, yLoc).creepArray.push(this);
						}
						
						break;
					case Direction.RIGHT:
						if (map.getTileAt(xLoc + 1, yLoc) != null) {
							this.direction = Direction.RIGHT;
							this.moving = true;
							face(Direction.RIGHT);
							map.getTileAt(xLoc, yLoc).creepArray.splice(map.getTileAt(xLoc, yLoc).creepArray.indexOf(this), 1);
							xLoc++;
							map.getTileAt(xLoc, yLoc).creepArray.push(this);
						}
						
						break;
				
				}
			}
					
		}
		
		
		
		//These functions are used to modify  the actual x and y coordinates of the creep
		public function moveUp():void {
			y -= moveMod;
		}
		public function moveDown():void {
			y += moveMod;
		}
		public function moveLeft():void {
			x -= moveMod;
		}
		public function moveRight():void {
			x += moveMod;
		}
		
		
		
		public function face(direction:uint):void {
			var angle:Number = 0;
			
			switch(direction) {
				case Direction.UP:
					angle = 0;
					break;
				case Direction.DOWN:
					angle = 180;
					break;
				case Direction.LEFT:
					angle = -90;
					break;
				case Direction.RIGHT:
					angle = 90;
					break;
					
				
			}
			
			
			var transMatrix:Matrix = new Matrix();
			transMatrix.translate(-map.size/2, -map.size/2);
			transMatrix.rotate(angle = Math.PI * 2 * angle / 360);
			transMatrix.translate(map.size/2, map.size/2);
			sprite.transform.matrix  = transMatrix;
			
		}
		
		//function to be used when creep takes damage
		public function takeDamage(damage:int):void {
			
			
			health -= damage;
			
			drawHealthBar();
		}
		
		//function that makes the creep do dmage to the map
		public function doDamage():void {
			
			map.hp -= this.damage;
		}
		
		
		//function for drawing the health bar
		public function drawHealthBar():void {
			healthBar.graphics.clear();
			
			healthBar.graphics.beginFill(0xFF0000);
			healthBar.graphics.drawRect(0, 0, map.size, barHeight);
			
			healthBar.graphics.beginFill(0x00FF00);
			healthBar.graphics.drawRect(0, 0, map.size * health / fullHealth, barHeight);
			
			healthBar.graphics.endFill();
			healthBar.graphics.lineStyle(1);
			healthBar.graphics.drawRect(0, 0, map.size, barHeight);
			
			
			
			
		}
		//This function is responsible for the movement of the creep and make sures thatits always aligned with the grid
		public function move():void {
			
			switch(direction) {
				case Direction.UP:
					moveUp();
					break;
				case Direction.DOWN:
					moveDown();
					break;
				case Direction.LEFT:
					moveLeft();
					break;
				case Direction.RIGHT:
					moveRight();
					break;
			}
			
			
			//The lines of codes below makes sure that the creep will be always aligned with the grid of the map
			var targetTile:Tile = map.getTileAt(xLoc, yLoc); 
			
			if ( this.y > targetTile.y && direction == Direction.DOWN || this.x > targetTile.x && direction == Direction.RIGHT) {
				this.x -=  this.x -  targetTile.x;
				this.y -= this.y - targetTile.y;
				this.moving = false;
			}
			if ( this.y < targetTile.y && direction == Direction.UP || this.x < targetTile.x && direction == Direction.LEFT) {
				this.x +=   -this.x +  targetTile.x;
				this.y += -this.y + targetTile.y;
				this.moving = false;
			}
		}
		
	}

}