package  
{
	import flash.display.DisplayObject;
	import flash.display.Graphics;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.utils.getQualifiedClassName;
	import Math;
	import flash.events.MouseEvent;
	import flash.ui.Mouse;
	import TurretTypes.*;
	import flash.utils.*;
	/**
	 * ...
	 * @author Vali
	 */
	public class Cell extends Sprite
	{
		private const UP:uint = 0;
		private const DOWN:uint = 1;
		private const LEFT:uint = 2;
		private const RIGHT:uint = 3;
		private const STAY:uint = 4;
		public var radiusCircle:Shape = new Shape();
		public var upgradeRadiusCircle:Shape = new Shape();
		private var statWindow:Sprite = new Sprite();
		private var statField:TextField = new TextField();
		
		private var lastFire:Number = new Date().time;
		private var fireDelay:Number = 300;
		public var rotateSpeed:Number = 10;
		public var damage:int = 10;
		
		public var expBar:Sprite = new Sprite();	
		public const expBarHeight:int = 5;
		public const expBarWidthMod:int = 5;
		
		public var range:Number = 200;

		public static var maze:Maze;
		public var row:int;
		public var col:int;
		public var vacant:Boolean = true;
		public var currTarget:Enemy = null;
		
		public var realX:int;
		public var realY:int;
		
		public var start:Boolean = false;
		public var end:Boolean = false;
		public var animFlag:Boolean = false;
		public var passable:Boolean = false;
		public var turret:Turret = null;
		
	
		
		[Embed(source = 'wall_select.png')]
		private var wallSelectImg:Class;
		
		[Embed(source = 'wall.png')]
		private var wallImg:Class;
		
		[Embed(source = 'turret.png')]
		private var turretImg:Class;
		
		[Embed(source = 'turret2.png')]
		private var turret2Img:Class;
	
		public function Cell(row:int, col:int) {
			statWindow.x = -500;
			statWindow.y = -500;
			statWindow.addChild(statField);
			this.row = row;
			this.col = col;
			
		}
		
		public function getCellAt(direction:uint):Cell {
			
			var tempCell:Cell;
			
			switch(direction) {
				case UP:
					tempCell = maze.getCellAt(row, col-1);
					break;
				case DOWN:
					tempCell = maze.getCellAt(row, col+1);
					break;
				case LEFT:
					tempCell = maze.getCellAt(row-1, col);
					break;
				case RIGHT:
					tempCell = maze.getCellAt(row+1, col);
					break;				
			}
			
			return tempCell;
		}
		
		
		public function getDistance(currEnemy:Enemy):Number {
			return Math.sqrt(Math.pow(currEnemy.realX - this.realX, 2) + Math.pow(currEnemy.realY - this.realY, 2));
			
		}
		
		public function getTarget(enemyArray:Array ):void{
			
			
			if(currTarget == null){
				//var target:Enemy = null;
				for (var i:int = 0; i < enemyArray.length; i++  ) {
					var currEnemy:Enemy = enemyArray[i];
					
					if(getDistance(currEnemy) <= range){
						if (currTarget == null) {
							currTarget= currEnemy;
						}
				
						if (getDistance(currEnemy) <= getDistance(currTarget)) {
							currTarget = currEnemy;
						}
					}
				}
				//currTarget = target;
			}else {
				if (getDistance(currTarget) > range) {
					currTarget = null;
				}
			}
			
	
		}
		public function onUp(event:MouseEvent):void {
			this.mouseclick();
		}
		
		
		
		public function mouseover(event:MouseEvent):void {
			
			if (Maze.selectMode > 0) {
				if (maze.dragFlag) {
				
					this.addEventListener(MouseEvent.MOUSE_UP, onUp);
				}
				
				//removeChildAt(0);
				//addChild(new wallSelectImg());
				getChildAt(0).alpha = .5;
				
				var radius:Number = 0;
				
				switch(Maze.selectMode) {
					case 1:
						radius = new Single(this).range;
						break;
					case 2:
						radius = new Spread(this).range;
						break;
					case 3:
						radius = new Pierce(this).range;
						break;
					case 4:
						radius = new Slow(this).range;
						break;
					case 5:
						radius = new Detector(this).range;
						break;
					
				}
				radiusCircle.graphics.beginFill(0xDDDDDD, .3);
				radiusCircle.graphics.lineStyle(1, 0x000000);				
				radiusCircle.graphics.drawCircle(this.x + this.width / 2, this.y +this.height / 2, radius );
				radiusCircle.graphics.endFill();
				maze.addChild(radiusCircle);
			}
			
		}
		
		
		public function mouseout(event:MouseEvent):void {
			
			if (Maze.selectMode) {
				if (maze.dragFlag) {
				
					this.removeEventListener(MouseEvent.MOUSE_UP, onUp);
				}
				
				//removeChildAt(0);
				//addChild(new wallImg());
				getChildAt(0).alpha = 0;
				radiusCircle.graphics.clear();
				maze.removeChild(radiusCircle);
			}
		}
		public function mouseclick(event:MouseEvent = null): void {
			if (Maze.selectMode > 0 && turret == null) {
				
				switch(Maze.selectMode) {
					case 1:
						turret = new Single(this);
						break;
					case 2:
						turret = new Spread(this);
						break;
					case 3:
						turret = new Pierce(this);
						break
					case 4:
						turret = new Slow(this);
						break
					case 5:
						turret = new Detector(this);
						break
				}
				
			
				if (turret.cost <= maze.resource) {
					BuildToggle.currButton.onClick();
					Mouse.show();
					
					maze.resource -= turret.cost;
					maze.resourceField.text = "" + maze.resource;
					removeChildAt(0);
					addChild(turret);
					Maze.turretArray.push(turret);
					this.removeEventListener(MouseEvent.MOUSE_OVER, mouseover);
					this.removeEventListener(MouseEvent.MOUSE_OUT, mouseout);
					
					statWindow.graphics.beginFill(0xffffff);
					statWindow.graphics.drawRect(0, 0, 80, 50);
					statWindow.graphics.endFill();
					
					expBar.graphics.beginFill(0xd1d1d1, 1);
					expBar.y = maze.cellSize - expBarHeight
					expBar.graphics.drawRect(expBarWidthMod, 0, maze.cellSize-expBarWidthMod*2, expBarHeight);
					expBar.graphics.endFill();
					addChild(expBar);
					this.addEventListener(MouseEvent.MOUSE_OVER, showRadius);
					this.addEventListener(MouseEvent.MOUSE_OVER, showStats);
					this.addEventListener(MouseEvent.MOUSE_OUT, hideRadius);
					this.addEventListener(MouseEvent.MOUSE_OUT, hideStats);
					upgradeRadiusCircle.graphics.clear();
					//radiusCircle.graphics.beginFill(0xDDDDDD, .3);
					//radiusCircle.graphics.lineStyle(1, 0x000000);				
					//radiusCircle.graphics.drawCircle(this.x + this.width/2, this.y +this.height/2, turret.range );
					//radiusCircle.graphics.endFill();
					if (turret.upgradeArray.length > turret.upgradeLevel) {
						upgradeRadiusCircle.graphics.clear();
						upgradeRadiusCircle.graphics.lineStyle(1, 0xFF0000);				
						upgradeRadiusCircle.graphics.drawCircle(this.x + this.width/2, this.y +this.height/2, turret.upgradeArray[turret.upgradeLevel].range);
					}
				}
				else {
					turret = null;
				}
			}
			
		/*	if (turret != null && !Maze.upgradeMode) {
				
				if (this.turret.upgradable()) {

					Maze.upgradeMode =  true;
					Maze.upgradeTurret = this.turret;
					if(Maze.selectMode > 0){
						Maze.selectMode = 0;
						UpgradeToggle.first.mouseCursor.removeChildAt(0);
						maze.removeEventListener(MouseEvent.ROLL_OVER,BuildToggle.showCursor);
						maze.removeEventListener(MouseEvent.ROLL_OUT, BuildToggle.hideCursor);
						Mouse.show();
					}
					
					
					maze.addChild(radiusCircle);
					maze.addChild(upgradeRadiusCircle);
					
					this.removeEventListener(MouseEvent.MOUSE_OVER, showRadius);
					this.removeEventListener(MouseEvent.MOUSE_OUT, hideRadius);
					
				
				}
				
				
			}
			else{
				if(turret != null){
					Maze.upgradeMode =  false;
					Maze.upgradeTurret = null;
	
					
					maze.removeChild(radiusCircle);
					maze.removeChild(upgradeRadiusCircle);
						
					this.addEventListener(MouseEvent.MOUSE_OVER, showRadius);
					this.addEventListener(MouseEvent.MOUSE_OUT, hideRadius);
				}

			}*/
			
			if (!Maze.sellMode && !Maze.selectMode <= 0 && turret != null) {
				
				
				showTurretWindow();
			}
			
			if (Maze.sellMode && turret != null) {
				sell();
			}
		}
		
		public function sell():void {
			this.radiusCircle.graphics.clear();
				maze.resource += turret.cost / 2;
				this.hideRadius(null);
				this.hideStats(null);
				this.removeChild(turret);
				this.removeChild(expBar);
				maze.resourceField.text = "" + maze.resource;
				removeEventListener(MouseEvent.MOUSE_OVER, showRadius);
				removeEventListener(MouseEvent.MOUSE_OUT, hideRadius); 
				this.removeEventListener(MouseEvent.MOUSE_OVER, showStats);
				this.removeEventListener(MouseEvent.MOUSE_OUT, hideStats);
				removeEventListener(MouseEvent.CLICK, mouseclick); 
				maze.makeWall(this.row, this.col);
				Maze.turretArray.splice(Maze.turretArray.indexOf(turret), 1);
				this.turret = null;

		}
		public function showRadius(event:MouseEvent):void {
			maze.addChild(radiusCircle);
			if (Maze.upgradeMode) {
				maze.addChild(upgradeRadiusCircle);
				if (turret.upgradeLevel< turret.upgradeArray.length) {
					maze.upgradeInfo.setStats(turret.upgradeArray[turret.upgradeLevel]);
					
				}
			}
		}
		
		public function showTurretWindow():void {
			//this.stage.addChild(new TurretWindow());
		}
		
		public function hideTurretWindow():void {
			
		}
		
		public function hideRadius(event:MouseEvent):void {
			try{
			maze.removeChild(radiusCircle);
			}
			catch (e:Error) {
				
			}
			if (Maze.upgradeMode) {
				maze.removeChild(upgradeRadiusCircle);
				if (turret.upgradeLevel < turret.upgradeArray.length) {
					
					maze.upgradeInfo.hide();
				}
			}
		}
		
		public function updateStats():void {
			
			expBar.graphics.clear();
			
			expBar.graphics.beginFill(0xd1d1d1, 1);
			expBar.graphics.drawRect(expBarWidthMod, 0, maze.cellSize - expBarWidthMod*2, expBarHeight);
			expBar.graphics.endFill();
			
			expBar.graphics.beginFill(0x28a8ff,  1);
			expBar.graphics.drawRect(expBarWidthMod, 0, (maze.cellSize - expBarWidthMod*2) * (turret.exp - turret.getPrevLvlReq())/(turret.getLvlReq()  - turret.getPrevLvlReq()), expBarHeight);
			expBar.graphics.endFill();
			
			statField.text = /*"Type: " + getQualifiedClassName(turret).substring("Turret Types:".length) + "\n" +*/
							"Lvl: " + turret.lvl + "\n" +
							"Exp: " + turret.exp + "/" + turret.getLvlReq() + "\n";
		}
		
		private function showStats(event:MouseEvent):void {
			if (!Maze.selectMode) {
				updateStats();
				this.stage.addEventListener(MouseEvent.MOUSE_MOVE, moveStatWindow);
				maze.addChild(statWindow);
			}
		}
		
		private function moveStatWindow(evemt:MouseEvent):void {
			try{
				statWindow.x = this.stage.mouseX + 20;
				statWindow.y = this.stage.mouseY + 20;
			}
			catch (e:Error) {
				
			}
		}
		private function hideStats(event:MouseEvent):void {
			if (!Maze.selectMode && !Maze.upgradeMode) {
				try{
					this.stage.removeEventListener(MouseEvent.MOUSE_MOVE, moveStatWindow);
					maze.removeChild(statWindow);
				}
				catch (e:Error) {
					
				}
			}
			
		}
		
		
	}

}