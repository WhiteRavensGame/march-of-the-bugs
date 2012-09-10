package  
{
	import BulletTypes.SprayBullet;
	import CreepToolbarPic.*;
	import CustomEvents.LevelLoadEvent;
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import CreepTypes.*;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.filters.GlowFilter;
	import flash.text.TextFormatDisplay;
	import flash.ui.Keyboard;
	import flash.text.TextField;
	import TurretTypes.*;
	import Window.*;
	import Maps.LevelValues;
	
	/**
	 * ...
	 * @author Vali
	 */
	public class Game extends Sprite
	{
		
		[Embed(source = 'td_background.png')]
		private var bgImg:Class;
		
		
		[Embed(source='Assets/resultWindows.swf', symbol='winWindow')]
		private var youWinImg:Class;
		[Embed(source='Assets/resultWindows.swf', symbol='failWindow')]
		private var youLoseImg:Class;
		
		private var gameOver:Boolean = false;
		private var hpText:TextField = new TextField();
		private var resourceText:TextField = new TextField();
		
		public var map:Map;
		public var keymap:Array = new Array();
		
		
		//[Embed(source='Assets/Toolbar.swf', symbol='ToolBar')]
		//public var toolBarImg:Class;
		
		//[42]
		[Embed(source='Assets/toolbarV4.swf', symbol='toolbarV4')]
		public var toolBarImg:Class;
		public var freshnessBar:Sprite;
		public var resourcesBar:Sprite;
	
		public var toolBar:Sprite = new toolBarImg();
		
		
		//[42]
		public var currLevel:int;
		public var briefWindow:Window.BriefingWindow;
		
		
		public function Game(map:Map, level:int) 
		{
			this.map = map;
		
			this.currLevel = level;
			
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		public function init(e:Event):void {
			toolBar.y = 50 * 9;
			addChild(map);

			
			resourceText = toolBar.getChildByName("resourcesField") as TextField;
			hpText = toolBar.getChildByName("freshnessField") as TextField;
			
			resourcesBar = toolBar.getChildByName("resourcesBar") as Sprite;
			freshnessBar = toolBar.getChildByName("freshnessBar") as Sprite;
			
			hpText.text = map.hp.toString() + " / " + map.maxHP.toString();
			resourceText.text = map.resource.toString() + " / " + map.initialResource.toString();
			
			
			addChild(toolBar);
			
			//glow filter, silhouette
			//var s:Sprite = new Sprite;
			//s.filters = new GlowFilter(
			//s.filters = [];
			//
			
			for (var i:int = 0; i < 256; i++) {
				keymap[i] = false;
				
			}
			
			//[42]
				if(PlayerProgress.bugsUnlocked[Constant.ID_RAT]) Sprite(toolBar.getChildByName("slot5")).addChild(new ToolbarRat());
				if(PlayerProgress.bugsUnlocked[Constant.ID_BLACKANT]) Sprite(toolBar.getChildByName("slot4")).addChild(new ToolbarBlackAnt());
				if(PlayerProgress.bugsUnlocked[Constant.ID_FLY]) Sprite(toolBar.getChildByName("slot3")).addChild(new ToolbarFly());
				if(PlayerProgress.bugsUnlocked[Constant.ID_COCKROACH]) Sprite(toolBar.getChildByName("slot2")).addChild(new ToolbarCockroach());
				if(PlayerProgress.bugsUnlocked[Constant.ID_TEENYANTS]) Sprite(toolBar.getChildByName("slot1")).addChild(new ToolbarTeenyAnts());
			
			setPath();
			
			briefWindow = new Window.BriefingWindow(BriefingScript.levelDesc[currLevel - 1], map.initialResource);
			briefWindow.addEventListener(BriefingWindow.START, activateControls);
			addChild(briefWindow);
			
			//activateControls();
			
			
		}
		
		public function activateControls(e:Event):void
		{
			//garbage collect
			briefWindow.removeEventListener(BriefingWindow.START, activateControls);
			briefWindow = null;
			
			
			//[42]
			toolBar.getChildByName("slot4").addEventListener(MouseEvent.CLICK, addCreep1);
			toolBar.getChildByName("slot2").addEventListener(MouseEvent.CLICK, addCreep2);
			toolBar.getChildByName("slot3").addEventListener(MouseEvent.CLICK, addCreep3);
			toolBar.getChildByName("slot5").addEventListener(MouseEvent.CLICK, addCreep4);
			toolBar.getChildByName("slot1").addEventListener(MouseEvent.CLICK, addCreep5);
			
			addEventListener(Event.ENTER_FRAME, update);
			
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDown);
			stage.addEventListener(KeyboardEvent.KEY_UP, keyUp);
		}
		
		public function update(e:Event):void {
			
			var a:Window;
			
			if(map.hp > 0){
				map.update();
				checkInput();
				if (map.hp < 0) {
					map.hp = 0;
				}
				
				hpText.text = map.hp.toString() + " / " + map.maxHP.toString();
				resourceText.text = map.resource.toString() + " / " + map.initialResource.toString();
				
				//[42] - updates the bar of the hp and resource text
				freshnessBar.scaleX = map.hp / map.maxHP;
				resourcesBar.scaleX = map.resource / map.initialResource;
				
				
				
			}
			else {
				removeEventListener(Event.ENTER_FRAME, update);
				stage.removeEventListener(KeyboardEvent.KEY_DOWN, keyDown);
				stage.removeEventListener(KeyboardEvent.KEY_UP, keyUp);
				//stage.addEventListener(KeyboardEvent.KEY_DOWN, restart);
				//addChild(new youWinImg());
				
				var levelScore:int = ScoreComputingManager.computeRating(map.resource / map.initialResource);
				
				a = new Window.VictoryWindow( levelScore  );
				addChild(a);
				a.addEventListener(VictoryWindow.LEVEL_SELECT, goToLevelSelect);
				a.addEventListener(VictoryWindow.RETRY, restartLevel);
				
				// SAVE!
				if (levelScore > PlayerProgress.highScores[currLevel - 1])
				{
					trace("NEW RECORD");
					PlayerProgress.highScores[currLevel - 1] = levelScore;
					DataManager.saveData();
				}
				if (currLevel == PlayerProgress.levelsUnlocked)
				{
					trace("NEW LEVEL UNLOCKED!");
					PlayerProgress.levelsUnlocked += 1;
					PlayerProgress.checkLevelUnlockRewards(); // checks if player unlocked something new upon level up
					
					DataManager.saveData();
					
					
				}
				
				
				gameOver = true;
			}
			
			if (map.resource < 10 && map.creepArray.length <= 0 && map.hp > 0) {
				removeEventListener(Event.ENTER_FRAME, update);
				stage.removeEventListener(KeyboardEvent.KEY_DOWN, keyDown);
				stage.removeEventListener(KeyboardEvent.KEY_UP, keyUp);
				//stage.addEventListener(KeyboardEvent.KEY_DOWN, restart);
				//addChild(new youLoseImg());
				
				a = new Window.LoseWindow;
				addChild(a);
				a.addEventListener(LoseWindow.LEVEL_SELECT, goToLevelSelect);
				a.addEventListener(LoseWindow.RETRY, restartLevel);
				gameOver = true;
				
				
			}
		}
		
		//[42]
		public function restartLevel(e:Event = null):void
		{
			//testing lang
			map.resource = map.initialResource;
			map.hp = LevelValues.initLife[currLevel - 1];
			
			gameOver = false;
			addEventListener(Event.ENTER_FRAME, update);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDown);
			stage.addEventListener(KeyboardEvent.KEY_UP, keyUp);
			
			
			//Make bugs disappear with the new level loading
			map.removeAllCreeps();
		}
		
		public function goToLevelSelect(e:Event):void {
			
			stage.addChild(new MapSelect());
			parent.removeChild(this);
			
		}
		
		public function keyDown(e:KeyboardEvent):void {
			keymap[e.keyCode] = true;
			
		}
		
		public function keyUp(e:KeyboardEvent):void {
			keymap[e.keyCode] = false;
		}
		
		public function checkInput():void {
			
			
			
			if (keymap[49]) {
				
				if (!PlayerProgress.bugsUnlocked[Constant.ID_TEENYANTS])
					return;
				map.addCreep(TeenyAnts);
			}
				
			if (keymap[50]) {
				
				if (!PlayerProgress.bugsUnlocked[Constant.ID_COCKROACH])
					return;
				map.addCreep(Cockroach);
				
			}
			if (keymap[51]) {
				if (!PlayerProgress.bugsUnlocked[Constant.ID_FLY])
					return;
				map.addCreep(Fly);
			}
				
			if (keymap[52]) {
				if (!PlayerProgress.bugsUnlocked[Constant.ID_BLACKANT])
					return;
				map.addCreep(BlackAnt);
				
			}
			if (keymap[53]) {
				if (!PlayerProgress.bugsUnlocked[Constant.ID_RAT])
					return;
				map.addCreep(Rat);
			}
		
			
			
			
		}
		
		public function addCreep1(e:Event):void {
			
			if (!PlayerProgress.bugsUnlocked[Constant.ID_BLACKANT])
				return;
			
			map.addCreep(BlackAnt);
		}
		
		public function addCreep2(e:Event):void {
			if (!PlayerProgress.bugsUnlocked[Constant.ID_COCKROACH])
				return;
			
			map.addCreep(Cockroach);
		}
		public function addCreep3(e:Event):void {
			if (!PlayerProgress.bugsUnlocked[Constant.ID_FLY])
				return;
			
			map.addCreep(Fly);
		}

		public function addCreep4(e:Event):void {
			if (!PlayerProgress.bugsUnlocked[Constant.ID_RAT])
				return;
			map.addCreep(Rat);
		}

		public function addCreep5(e:Event):void {
			if (!PlayerProgress.bugsUnlocked[Constant.ID_TEENYANTS])
				return;
			map.addCreep(TeenyAnts);
		}

		
		//This function sets the pathing of the creeps
		public function setPath():void {
			
			
			
		}
		
	}

}