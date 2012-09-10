package  
{
	import Color.Colors;
	import EnemyTypes.*;
	import flash.display.*;
	import flash.events.*;
	import flash.text.TextField;
	import TurretTypes.*;
	/**
	 * ...
	 * @author Vali
	 */
	
	 
	 /*
	  *  
	  * 
	  */
	public class Maze extends Sprite
	{
		
		public var rowSize:int = 20;
		public var colSize:int = 12;
		public var cellSize:int = 32;
		public var cellArray:Array = new Array();
		public var upgradeInfo:UpgradeInfo = new UpgradeInfo();
		public var pathArray: Array = new Array();
		public var deadArray:Array = new Array();
		public var startCell:Cell;
		public var dragFlag:Boolean = false;
		
		public var bulletArray:Array = new Array();
		public var resource:int = 5000;
		public var skillPoints:int = 1;
		public var resourceField:TextField = new TextField();
		
		public var gameover:Boolean = false;
		
		public var tutorial:Tutorial = null;
		
		public static var sellMode:Boolean = false;
		public static var selectMode:int = 0;
		public static var upgradeMode:Boolean = false;
		public static var upgradeTurret:Turret = null;
		public static var turretArray:Array = new Array();
		
		
		public var waveManager:Wave;
		
		public var redPower:int = 0;
		public var bluePower:int = 0;
		public var yellowPower:int = 0;
		public var greenPower:int = 0;
		//from main START-----------o
		private var lastSpawn:Number = new Date().time;
		private var spawnDelay:Number = 200;
		private var lifeField:TextField;
		public var lifeBar:Sprite;
		public var life:int = 100;
		private var dummyCellStart:Cell;
		//from main End ----------o
		
		public const UP:uint = 0;
		public const DOWN:uint = 1;
		public const LEFT:uint = 2;
		public const RIGHT:uint = 3;
		public const STAY: uint = 4;
		
		
		[Embed(source = 'wall.png')]
		private var wallImg:Class;
		
		[Embed(source='EnemyTypes/[export]projects and box.swf', symbol='corruptionBox_static')]
		private var boxImg:Class;
		
		[Embed(source = 'EnemyTypes/[export]projects and box.swf', symbol = 'corruptBox_animate')]
		private var boxAnim:Class;
		
		[Embed(source = 'npc.png')]
		private var npcImg:Class;
		
		[Embed(source = 'white.png')]
		private var whiteImg:Class;
		
		[Embed(source = 'cell.png')]
		private var cellImg:Class;
		
		[Embed(source = 'td_background.png')]
		private var bgImg:Class;

		
		public function Maze() 
		{
		}
		
		public function init():void{
			addChild(new bgImg());
			
			Turret.maze = this;
			Cell.maze = this;
			Enemy.maze = this;
			Bullet.maze = this;
			
			
			for (var i:int = 0; i < rowSize; i++ ) {
				for (var j:int = 0; j < colSize; j++ ) {
					var currCell:Cell = new Cell(i, j);
					cellArray.push(currCell);
					currCell.x = currCell.realX = i * cellSize;
					currCell.y =  currCell.realY = j * cellSize;
					addChild(currCell);
					makeWall(i,j);
				}
			}
			
			
			// path builder START
			/*Path.maze = this;
			for (i = 0; i < pathArray.length; i++){
				pathArray[i].init();
			}*/
			//path Builder END
			
			//make mansion tiles unbuildable START
			//setUnbuildableCells();
			//make mansion tiles unbuildable END
			
			//code from main START ----------------o
			
			//dummyCellStart.addChild(new npcImg());
			dummyCellStart = new Cell(0, 0);
			dummyCellStart.x = this.cellSize*1.5;
			dummyCellStart.y = this.cellSize;
			addChild(dummyCellStart);
			
			
			//code from main END -----------------o
			
			
		}
		
		public function setUnbuildableCells():void {
			
			for (var i:int = 0; i < deadArray.length; i++ ){
				var cell:Cell = deadArray[i];
		
				makeCell(cell.row, cell.col);
			}
	
		}
		
		
		public function makeWall(row:int, col:int):void {
			
			var newWall:Cell = getCellAt(row, col);
			newWall.passable = false;
			newWall.addChildAt(new whiteImg(), 0);
			newWall.getChildAt(0).alpha = 0;
			newWall.addEventListener(MouseEvent.MOUSE_OVER, newWall.mouseover);
			newWall.addEventListener(MouseEvent.MOUSE_OUT, newWall.mouseout); 
			newWall.addEventListener(MouseEvent.CLICK, newWall.mouseclick); 
			
		}
		
		public function makeCell(row:int, col:int):void {
			
			var newCell:Cell = getCellAt(row, col);
			newCell.passable = true;
			//newCell.removeChildAt(0);
			//newCell.addChild(new cellImg());
			newCell.removeEventListener(MouseEvent.MOUSE_OVER, newCell.mouseover);
			newCell.removeEventListener(MouseEvent.MOUSE_OUT, newCell.mouseout); 
			newCell.removeEventListener(MouseEvent.CLICK, newCell.mouseclick); 
			
		}
		public function updateBullets():void {
			var currBullet:Bullet;			
				var deadBulletArray:Array = new Array();
			for (var i:int = 0; i < this.bulletArray.length; i++ ) {
				currBullet = bulletArray[i];
				currBullet.seekTarget();
				if (currBullet.hit) {
					deadBulletArray.push(currBullet);				
				}
				
				if (currBullet is HomingBullet) {
					if (HomingBullet(currBullet).currTarget.dead && !currBullet.hit) {
						deadBulletArray.push(currBullet);
					}
				}
				
			}
			for (i = 0; i < deadBulletArray.length; i++ ) {
				currBullet = deadBulletArray[i];
				
				this.removeChild(currBullet);
				bulletArray.splice(bulletArray.indexOf(currBullet), 1);
				
				
			}
			
			
		}
		
		
		public function getCellAt(row:int, col:int):Cell {
			var tempCell:Cell;
			if ((row > this.rowSize - 1 || row < 0 || col > this.colSize - 1 || col < 0)&&!(row == this.rowSize-1 && col == this.colSize)) {
				tempCell = new Cell(row, col);
					tempCell.passable = false;
				
			}
			else {
				tempCell = cellArray[row * this.colSize  + col];
			}
			
			return tempCell;
			
		}
		
		public function fireTurrets(enemyArray:Array):void {
			var currTurr:Turret;
			for (var i:int = 0; i < turretArray.length; i++ ) {
				currTurr = turretArray[i];
				if(currTurr is Detector){
						currTurr.getTarget(enemyArray);
						currTurr.attackTarget();
				}
				
			}
			var deadEnemies:Array = new Array();
			for (i = 0; i < turretArray.length; i++ ) {
				currTurr = turretArray[i];
					currTurr.getTarget(enemyArray);
					currTurr.attackTarget();
				
			}
		}
		
		
		
		//main codes STRARTS here!--------------------------------------0
		
		public function startWave(event:MouseEvent):void {
			if(!stage.hasEventListener(Event.ENTER_FRAME) && !gameover)
				this.stage.addEventListener(Event.ENTER_FRAME, update);
			
			waveManager.nextWave();
		}
		
		public function update(event:Event):void {
			var currEnemy:Enemy;
			var ability:Ability = new Ability();
			if (new Date().time - lastSpawn > spawnDelay && waveManager.enemyTypeArray.length > waveManager.enemyCount) {
				var enemyType:Stat = waveManager.enemyTypeArray[waveManager.enemyCount];
				currEnemy = EnemyFactory.create(enemyType);
				waveManager.enemyCount++;
				
				addEnemy(currEnemy);
				
				
				lastSpawn = new Date().time; 
			}
			
			
			for (var i:int = 0; i < waveManager.enemyArray.length; i++ ) {
				currEnemy = waveManager.enemyArray[i];
				if(!currEnemy.dead && !currEnemy.ailments.freeze){
					checkMove(currEnemy);
				}
				currEnemy.ailments.update();
				currEnemy.ability.update();
				checkDead(currEnemy);
				clean(currEnemy);
			
			}	
			
			if (!this.waveManager.waveDone && this.waveManager.enemyArray.length <= 0) {
				if (!this.waveManager.leak) {
					resource += Math.ceil(resource/50);
					resourceField.text = "" + resource;
				}
				this.waveManager.waveDone = true;
				this.waveManager.leak = false;
				this.waveManager.checkMessages();
			}
			
			
			Maze.turretArray.forEach(turretUpdate);
			this.fireTurrets(waveManager.enemyArray);
			this.updateBullets();
			this.checkGameover();
		}
	
		
		public function checkGameover():void {
			if (life <= 0 || waveManager.waveCount >= waveManager.enemyWaveArray.length && waveManager.waveDone) {
				gameover = true;
			}
			
		}
		
		
		
		public function turretUpdate(turret:Turret, i:int, array:Array):void {
			turret.gunUpdate();
		}
		
		
		public function addEnemy(currEnemy:Enemy):void {
			Ability
				waveManager.enemyArray.push(currEnemy);
				addChild(currEnemy);
				swapChildrenAt(getChildIndex(dummyCellStart), getChildIndex(currEnemy));
				var i:int = 0;
				for (i = 0 ; i < pathArray.length; i++ ) {
					var path:Path = pathArray[i];
					var dummyCellEnd:Cell =  path.dummyCellEnd;
					swapChildrenAt(getChildIndex(dummyCellEnd), getChildIndex(currEnemy));
				}
				currEnemy.init();
		}
		
		private function checkDead(currEnemy:Enemy):void {
			
			if (currEnemy.health <= 0) {
				currEnemy.dead = true;
				this.getCellAt(currEnemy.xLoc, currEnemy.yLoc).vacant = true;
			}
			
			if (currEnemy.dead && !currEnemy.counted) {
				currEnemy.counted = true;
				currEnemy.ability.onDead();
				this.resource += currEnemy.bounty;
				Sounds.playCheck1();
				this.resourceField.text = "" + this.resource;
				
			}
			
		}
		
		private function clean(currEnemy:Enemy):void {
			var currCell:Cell = getCellAt(currEnemy.xLoc, currEnemy.yLoc)
			if (!currEnemy.moving && currCell.end && !currEnemy.dead) {
				currEnemy.path.dummyCellEnd.animFlag = true;
				minusLife(currEnemy.health / 10);
				waveManager.leak = true;
				
			}
			
			if (currEnemy.dead) {
				if (!currEnemy.dying) {
					currEnemy.changeDeadImg();
					currEnemy.dying = true;
					currEnemy.alpha = 1;
				}
				
				currEnemy.alpha -= .05;
				
			}
				
			if (!currEnemy.moving && getCellAt(currEnemy.xLoc, currEnemy.yLoc).end  || currEnemy.dead && currEnemy.alpha <= 0) {
				currEnemy.dead = true;
				removeChild(currEnemy);
				waveManager.enemyArray.splice(waveManager.enemyArray.indexOf(currEnemy),1);	
			}
				
			
		}
		
		
		private function checkMove(currEnemy:Enemy):void {
			
			
			if (!currEnemy.moving) {
				
				var direction:uint = currEnemy.pathDirection();
				
				if (direction == UP && checkVacancy(currEnemy, UP)) {
					currEnemy.setDirection(UP); 
				
				}else if (direction == DOWN  && checkVacancy(currEnemy, DOWN)) {
					currEnemy.setDirection(DOWN);
					
				
				}else if (direction == LEFT&& checkVacancy(currEnemy, LEFT)) {
				
					currEnemy.setDirection(LEFT);
					
				
				}else if (direction == RIGHT  && checkVacancy(currEnemy, RIGHT)) {
					currEnemy.setDirection(RIGHT);

				}
			}
			
				if(currEnemy.moving){
					currEnemy.move();
				}
		}
		
		private function checkVacancy(currEnemy:Enemy, direction:uint):Boolean {
			var currCell:Cell = this.getCellAt(currEnemy.xLoc, currEnemy.yLoc);
			switch(direction) {
				case UP:
					return currCell.getCellAt(UP).vacant;
					break;
				case DOWN:
					return currCell.getCellAt(DOWN).vacant;
					break;
				case LEFT:
					return currCell.getCellAt(LEFT).vacant;
					break;
				case RIGHT:
					return currCell.getCellAt(RIGHT).vacant;
					break;
				
			}
			
			
			return true;
		}
		
		
		private function minusLife(minus:int ):void {
			this.life -= minus;
			Sounds.playPaper();
			if (this.life < 0) {
					this.life = 0;
			}
			lifeField.text = "" + this.life; 
			
			lifeBar.getChildAt(1).scaleY = this.life / 100 * lifeBar.height;
			var i:int = 0 ;
			for (i = 0 ; i < pathArray.length; i++ ) {
				var path:Path = pathArray[i];
				var dummyCellEnd:Cell =  path.dummyCellEnd;
					
				if(dummyCellEnd.animFlag){
					if(dummyCellEnd.getChildAt(0) is MovieClip){
						(dummyCellEnd.getChildAt(0) as MovieClip).stop();
					}
					dummyCellEnd.removeChildAt(0);
					dummyCellEnd.addChild(new boxAnim());
					var endCell:MovieClip = (dummyCellEnd.getChildAt(0) as MovieClip);
					endCell.addFrameScript(endCell.totalFrames - 1, path.resetEndCellAnim);
					dummyCellEnd.animFlag = false;
				}
					
				
			}
		}
			
		//main codes END here-------------------------------------------------------0
		
		public function freezeAll():void {
			
			var i:int;
			for (i = 0; waveManager.enemyArray.length > i; i ++) {
				var currEnemy:Enemy = waveManager.enemyArray[i];
				currEnemy.ailments.setFreeze(2000);
			}
		}
		public function slowAll():void {
			
			var i:int;
			for (i = 0; waveManager.enemyArray.length > i; i ++) {
				var currEnemy:Enemy = waveManager.enemyArray[i];
				currEnemy.ailments.setSlow(3000);
			}
		}
		
		public function turretDoubleSpd():void {
			turretArray.forEach(doubleSpd);
		}
		
		public function doubleSpd(turret:Turret, i:int, arr:Array):void {
			turret.doubleSpeed();
		}
		
		public function turretDoubleDmg():void {
			turretArray.forEach(doubleDmg);
		}
		
		public function doubleDmg(turret:Turret, i:int, arr:Array):void {
			turret.doubleDamage();
		}
		
		public function addPower(power:Power): void {
			var i:int;
			switch(power.color) {
				case Colors.RED:
					this.redPower++;
					if (this.redPower > Power.powerReq ) {
						redPower--;
					}else{
						Power.powerBar[Colors.RED].add()
					}
					break;
				case Colors.BLUE:
					this.bluePower++;
					if (this.bluePower > Power.powerReq ) {
						bluePower--;
					}else{
						Power.powerBar[Colors.BLUE].add()
					}
					break;
				case Colors.YELLOW:
					this.yellowPower++;
					if (this.yellowPower > Power.powerReq ) {
						yellowPower--;
					}else{
						Power.powerBar[Colors.YELLOW].add()
					}
					break;
				case Colors.GREEN:
					this.greenPower++;
					if (this.greenPower > Power.powerReq ) {
						greenPower--;
					}else{
						Power.powerBar[Colors.GREEN].add()
					}
					break;
			
			}
			
			
		}
		
	}

}