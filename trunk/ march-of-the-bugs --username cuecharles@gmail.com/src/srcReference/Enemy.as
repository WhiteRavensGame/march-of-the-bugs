package  
{
	import EnemyTypes.Fast1;
	import flash.display.DisplayObject;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.geom.Matrix;
	/**
	 * ...
	 * @author Vali
	 */
	public class Enemy extends Sprite
	{
		public const healthBarHeight:int = 5;
		public const rotating:Boolean = true;
		
		public var moveMod:int = 10;
		public var pathNode: Node;
		public var health:int;
		public var maxHealth:int;
		public var dead:Boolean = false;
		public var taken:Boolean = false;
		public var path:Path;
	
		
		public var pathArray: Array = new Array();
		public var pathProg: int = 0;
		public var bounty:int;
		public var counted:Boolean = false;
		
		public const UP:uint = 0;
		public const DOWN:uint = 1;
		public const LEFT:uint = 2;
		public const RIGHT:uint = 3;
		public const STAY: uint = 4;
		
		public static var maze:Maze;
		
		public var direction:uint  = DOWN;
		public var moving:Boolean = false;
		
		public var xLoc:int = 1;
		public var yLoc:int = 1;
		public var realY:int = -50;
		public var realX:int = 0;
		public var enemyFace:Face;
		
		public var ailments:Effects;
		public var ability:Ability;
		
		public var dying:Boolean = false;
		
		private var enemySprite:Sprite = new Sprite();
		private var enemyDeadSprite:Sprite = new Sprite();
		
		
		[Embed(source='projectSprites/project_unchecked.png')]
		private var enemyImg:Class;
		[Embed(source='projectSprites/project_checked.png')]
		private var enemyDeadImg:Class;
		
		[Embed(source = 'EnemyFace/front.png')]
		private var front:Class;
		[Embed(source = 'EnemyFace/back.png')]
		private var back:Class;
		[Embed(source = 'EnemyFace/left.png')]
		private var left:Class;
		[Embed(source = 'EnemyFace/right.png')]
		private var right:Class;
		
		
		public function Enemy(speed:int = 5, health:int = 1, bounty:int = 5, enemySprite:DisplayObject = null, enemyDeadSprite:DisplayObject = null, ability:Ability = null) 
		{
			
			
			
			ailments = new Effects(this);
			if (ability == null) {
				
				ability = new Ability();
			}
			ability.enemy = this;
			this.ability = ability
			ability.init();
			
			if (this.rotating) {
				
				this.graphics.beginFill(0x000000, 0);
				this.graphics.drawRect(0, 0, maze.cellSize, maze.cellSize);
				this.graphics.endFill();
				if (enemySprite == null) {
					this.enemySprite.addChild(new enemyImg());
					addChild(this.enemySprite);
				}
				else {
					this.enemySprite.addChild(enemySprite);
				}
				
				if (enemyDeadSprite == null) {
					this.enemyDeadSprite.addChild(new enemyDeadImg());
				}
				else {
					this.enemyDeadSprite.addChild(enemyDeadSprite);
				}
				
				this.width = maze.cellSize;
				this.height = maze.cellSize;
				
			}
			else {
				
				this.enemyFace = new Face(new front(), new back(), new left(), new right());
				addChild(this.enemyFace.currFace);

			}
			if(this.rotating){
				//x = this.width/2;
				//y = this.height / 2 - this.height;
				//this.getChildAt(0).x  = -this.width/2;
				//this.getChildAt(0).y = -this.height/2;
				x = maze.cellSize;
				y = maze.cellSize;
			}
			else{
				x = maze.cellSize;
				y = maze.cellSize;
			}
			refreshImage();
					
			realX = maze.cellSize;
			realY = maze.cellSize;
			
			var rand:int = (Math.random() * 10) % maze.pathArray.length;
			
			var path:Path = maze.pathArray[rand] as Path;
			
			this.path = path;
			pathArray = path.dirArray;
			this.x = path.start.x;
			this.y = path.start.y;
			realX = path.start.x;
			realY = path.start.y;
			this.xLoc = path.start.row;
			this.yLoc = path.start.col;
			
			
			//this.transform.matrix.concat();
			this.bounty = bounty
			this.moveMod = speed;
			this.maxHealth = this.health = health;
			this.graphics.beginFill(0x00FF00, 1);
			this.graphics.drawRect(0, maze.cellSize - healthBarHeight, maze.cellSize, healthBarHeight);
			this.graphics.endFill();
		}
		
		public function refreshImage():void {
			
				
			
		}
		
		public function init():void {
			enemyDeadSprite.x = -(enemyDeadSprite.width - this.width)/4;
			enemySprite.x = -(enemySprite.width - this.width)/4;
			this.addChild(enemySprite);
			
			
		}
		
		public function takeDamage(damage:int):void {
			health -= damage;
			if (health < 0) {
				health = 0;
			}
			this.graphics.clear();
			
			this.graphics.beginFill(0xFF0000, 1);
			this.graphics.drawRect(0, maze.cellSize - healthBarHeight, maze.cellSize, healthBarHeight);
			this.graphics.endFill();
			
			this.graphics.beginFill(0x00FF00,  1);
			this.graphics.drawRect(0, maze.cellSize - healthBarHeight, maze.cellSize * health/maxHealth, healthBarHeight);
			this.graphics.endFill();
		}
		
		public function moveUp():void {
			if(this.rotating){
				//this.rotation = 0;
			}
			else {
				if (this.enemyFace.back != this.enemyFace.currFace) {
					removeChild(this.enemyFace.currFace);
					addChild(this.enemyFace.back);
					this.enemyFace.currFace = this.enemyFace.back;
				}
			}
			y -= moveMod;
			realY -= moveMod;
		}
		
		public function changeDeadImg():void {
			removeChildAt(0);
			addChild(enemyDeadSprite);
		}
		public function moveDown():void {
			if(this.rotating){
				//this.rotation = 180;
			}
			else {
				if (this.enemyFace.front != this.enemyFace.currFace) {
					removeChild(this.enemyFace.currFace);
					addChild(this.enemyFace.front);
					this.enemyFace.currFace = this.enemyFace.front;
				}
			}
				
			y += moveMod;
			realY += moveMod;
		}
		
		public function moveRight():void {
			if(this.rotating){
				//this.rotation = 90;
			}
			else {
				if (this.enemyFace.right != this.enemyFace.currFace) {
					removeChild(this.enemyFace.currFace);
					addChild(this.enemyFace.right);
					this.enemyFace.currFace = this.enemyFace.right;
				}
			}
			x += moveMod;
			realX += moveMod;
		}
		
		public function moveLeft():void {
			if(this.rotating){
				//this.rotation = -90;
			}
			else {
				if (this.enemyFace.left != this.enemyFace.currFace) {
					removeChild(this.enemyFace.currFace);
					addChild(this.enemyFace.left);
					this.enemyFace.currFace = this.enemyFace.left;
				}
			}
			x -= moveMod;
			realX -= moveMod;
		}
		
	
		
		public function setDirection(direction:uint):void {
			switch(direction) {
				case UP:
					if (maze.getCellAt(xLoc, yLoc - 1).passable) {
						this.direction = UP;
						this.moving = true;
						yLoc--;
					}
					
					break;
				case DOWN:
					if (maze.getCellAt(xLoc, yLoc + 1).passable) {
						this.direction = DOWN;
						this.moving = true;
						yLoc++;
					}
					
					break;
				case LEFT:
					if (maze.getCellAt(xLoc - 1, yLoc).passable) {
						this.direction = LEFT;
						this.moving = true;
						xLoc--;
					}
					
					break;
				case RIGHT:
					if (maze.getCellAt(xLoc + 1, yLoc).passable) {
						this.direction = RIGHT;
						this.moving = true;
						xLoc++;
					}
					
					break;
			
			}
					
		}
		
		public function move():void {
			
			switch(direction) {
				case UP:
					moveUp();
					break;
				case DOWN:
					moveDown();
					break;
				case LEFT:
					moveLeft();
					break;
				case RIGHT:
					moveRight();
					break;
			}
			
			var targetCell:Cell = maze.getCellAt(xLoc, yLoc); 
			if (this.realX >= targetCell.realX && this.realY >= targetCell.realY && (direction == DOWN || direction == RIGHT)) {
				this.x -=  this.realX -  targetCell.realX;
				this.y -= this.realY - targetCell.realY;
				this.realX -=  this.realX -  targetCell.realX;
				this.realY -= this.realY - targetCell.realY;
				this.moving = false;
			}
			if (this.realX <= targetCell.realX && this.realY <= targetCell.realY && (direction == UP|| direction == LEFT)) {
				this.x +=   -this.realX +  targetCell.realX;
				this.y += -this.realY + targetCell.realY;
				this.realX +=  -this.realX +  targetCell.realX;
				this.realY += -this.realY + targetCell.realY;
				this.moving = false;
			}
			
			refreshImage();
			
		}
		
	
		
		public function pathDirection():uint {
			
			if(pathProg < pathArray.length){
				var direction:uint = pathArray[pathProg];
			
				pathProg++;
			}
			else {
				direction = STAY;
			}
			return direction;
		}
	
		
	}

}