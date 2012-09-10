package  
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Matrix;
	/**
	 * ...
	 * @author Vali
	 */
	public class Turret extends Sprite
	{
		
		
		public var damage:int = 30;
		public var speed:int = 50;
		public var frameCount: int = speed;
		public var targetTiles:Array = new Array();
		static public var map:Map;
		public var parentTile:Tile;
		public var turretName:String = "Default";
		public var description:String = "Derp"
		
		public var target:Creep = null;
		
		//cooldown bar
		public var coolDownBar:Sprite = new Sprite();
		public var barHeight:int = 3; 
		
		public var direction:uint = Direction.DOWN;
		
		public var sprite:Sprite = new Sprite();
		
		public var isTurning:Boolean = false;
		public var reachFlying:Boolean = false;
		
		public var tileAreaDamage:Boolean = false;
		
		public function Turret(parentTile:Tile, direction:uint, bHitFlying:Boolean = false ) 
		{
			addChild(sprite);
			x = parentTile.x;
			y = parentTile.y;
			this.direction = direction;
			
			this.parentTile = parentTile;
			this.reachFlying = bHitFlying;
			
			setTargets();
			
			addEventListener(MouseEvent.ROLL_OVER, rollOver);
			addEventListener(MouseEvent.ROLL_OUT, rollOut);
			
			
			coolDownBar.y = map.size - barHeight;
			addChild(coolDownBar);
			showRange();
			drawCooldownBar();
		}
		
		//Actions to be done by the turret per frame
		public function update():void {
			frameCount++;
			if(frameCount >= speed){
				if (fire()) {
					frameCount = 0;
				
				}
			}
			
			if (frameCount > speed) {
				
				frameCount = speed;
			}
			else {
				drawCooldownBar();
				
			}
			
			if (isTurning && target != null) {
				faceTarget();
			}
		}
		
		public function getTargetAngle():Number {
			
			 return Math.atan2(target.y - parentTile.y, target.x - parentTile.x);
		}
		
		
		public function faceTarget():void {
			
			
			var transMatrix:Matrix = new Matrix();
			transMatrix.translate(-map.size/2, -map.size/2);
			transMatrix.rotate(getTargetAngle());
			transMatrix.translate(map.size / 2, map.size / 2);
			
			sprite.transform.matrix  = transMatrix;
			
		}
		
		public function drawCooldownBar():void {
			coolDownBar.graphics.clear();
			
			coolDownBar.graphics.beginFill(0x333333);
			coolDownBar.graphics.drawRect(0, 0, map.size, barHeight);
			
			coolDownBar.graphics.beginFill(0x3333FF);
			coolDownBar.graphics.drawRect(0, 0, map.size * frameCount / speed, barHeight);
			
			
			coolDownBar.graphics.endFill();
			coolDownBar.graphics.lineStyle(1);
			coolDownBar.graphics.drawRect(0, 0, map.size, barHeight);
		}
		
		//does damage to enemies currently on the turrets target tiles
		public function fire():Boolean {
			var shot:Boolean = false;
			
			checkTarget();
			if (target == null) {
				getTarget();
			}
			if (target != null) {
				// [42] - ignore flying creatures if this turret cannot reach flying enemies
				if (target.isFlying && this.reachFlying == false)
					return false;
					
				doDamageTo(target);
				shot = true;
			}
			
			return shot;
		}
		
		// checks if current target is still within range
		public function checkTarget():void {
			if (targetTiles.every(targetNotInTile)) {
				target = null;
			}
		}
		
		//function used to check if an element in the targetTiles array still has the current target creep
		public function targetNotInTile(element:Tile, index:int, array:Array):Boolean {
			if (element.creepArray.indexOf(target) != -1) {
				return false;
			}
			
			return true;
		}
		
		
		//gets the target with the lowest hp in the target tiles
		public function getTarget():void{
			
			var i:int = 0;
			var j:int = 0;
			var weakest:Creep = null;
			for (i = 0; i < targetTiles.length; i++ ) {
				var tile:Tile = targetTiles[i];
				for (j = 0;  j < tile.creepArray.length; j++ ) {
					var creep:Creep = tile.creepArray[j];
					
					if (!creep.moving) {
						
						if(weakest == null){
							weakest = creep;
						}else {
							if (weakest.health > creep.health) {
								weakest = creep;
							}
						}
						//i = targetTiles.length;
						//tj = tile.creepArray.length;
						
					}
				}
				
			}
			
			
			target = weakest;
		}
		
		// function used to do damage to creep
		public function doDamageTo(creep:Creep):void {
			
			if (tileAreaDamage) {
				var creepArray:Array = map.getTileAt(creep.xLoc, creep.yLoc).creepArray;
				creepArray.forEach(attackArea);
			}
			else {
				creep.takeDamage(damage);
			}
			
			bulletAnim();
		}
		
		public function bulletAnim():void {
			
		}
		
		public function attackArea(creep:Creep, index:int, arr:Array):void {
			creep.takeDamage(damage);
		}
		
		
		//Highlights the target tiles of the turret
		public function showRange():void {
			var i:int = 0;
			
			for (i = 0; i < targetTiles.length; i++) {
				var tile:Tile = targetTiles[i];
				tile.highlight();
				
				for (var direction:int = 0; direction < 4; direction++ ) {
					
					if (this.targetTiles.indexOf(tile.getTileAt(direction)) == -1 ) {
						tile.drawBorder(direction);
					}
					
				}
			}
		}
		
		
		//removes the highlights of the tiles
		public function hideRange():void {
			
			var i:int = 0;
			
			for (i = 0; i < targetTiles.length; i++) {
				
				Tile(targetTiles[i]).clearGprahics();
			}
			
		}
		
		
		//Stuff to do on mouseover, does the hideRange function on all the other turrets
		public function rollOver(e:MouseEvent):void {
			map.showTurretStats(this);
			var i:int = 0;
			var turret:Turret;
			for (i = 0; i < map.turretArray.length; i++ ) {
				turret = map.turretArray[i];
				turret.hideRange();
			}
			
			showRange();
		}
		
		
		//Stuff to do on mouseout, does the showRange function on all the other turrets
		public function rollOut(e:MouseEvent):void {
			map.hideTurretStats();
			var i:int = 0;
			var turret:Turret;
			for (i = 0; i < map.turretArray.length; i++ ) {
				turret = map.turretArray[i];
				if (turret != this) {
					turret.showRange();
				}
				
			}
			
		}

		//sets the targets tile of the turret
		public function setTargets():void {
			
			AttackPatternFactory.smCross(this);
			
		}
		
		//used to filter out target tiles that are outside the map
		public function filterNull(tile:Tile, i:int, array:Array):Boolean {
			
			if (tile == null) {
				return false;
			}
			
			return true;
			
			
			
		}
		
	}

}