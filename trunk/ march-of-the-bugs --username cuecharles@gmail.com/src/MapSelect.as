package  
{
	import CustomEvents.LevelLoadEvent;
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.filters.BitmapFilter;
	import flash.filters.ColorMatrixFilter;
	import TurretTypes.*;
	import Maps.*;
	
	/**
	 * ...
	 * @author Vali
	 */

	public class MapSelect extends Sprite
	{
		
		[Embed(source = 'Assets/MapSelect.swf', symbol = 'LevelSelect2')]
		public var mapImg:Class;
		
		public var mapClip:Sprite = new mapImg();
		public var mapSprite:Sprite = new Sprite();
		
		public var levelData:LevelInfoTip = new LevelInfoTip();
		
		
		//public var game:Game;
		
		public function MapSelect() 
		{
			mapSprite.addChild(mapClip);
			mapClip.x = -100;
		
			// TODO: COMPRESS these events!!!
			mapClip.getChildByName("BrownButton1").addEventListener(MouseEvent.CLICK, map1);
			mapClip.getChildByName("BrownButton2").addEventListener(MouseEvent.CLICK, map2);
			mapClip.getChildByName("BrownButton3").addEventListener(MouseEvent.CLICK, map3);
			
			mapClip.getChildByName("GreenButton1").addEventListener(MouseEvent.CLICK, map4);
			mapClip.getChildByName("GreenButton2").addEventListener(MouseEvent.CLICK, map5);
			mapClip.getChildByName("GreenButton3").addEventListener(MouseEvent.CLICK, map6);
			mapClip.getChildByName("GreenButton4").addEventListener(MouseEvent.CLICK, map7);
			mapClip.getChildByName("GreenButton5").addEventListener(MouseEvent.CLICK, map8);
			mapClip.getChildByName("GreenButton6").addEventListener(MouseEvent.CLICK, map9);
			mapClip.getChildByName("GreenButton7").addEventListener(MouseEvent.CLICK, map10);
			
			
			mapClip.getChildByName("BrownButton1").addEventListener(MouseEvent.MOUSE_OVER, showInfo);
			mapClip.getChildByName("BrownButton2").addEventListener(MouseEvent.MOUSE_OVER, showInfo);
			mapClip.getChildByName("BrownButton3").addEventListener(MouseEvent.MOUSE_OVER, showInfo);
			
			mapClip.getChildByName("GreenButton1").addEventListener(MouseEvent.MOUSE_OVER, showInfo);
			mapClip.getChildByName("GreenButton2").addEventListener(MouseEvent.MOUSE_OVER, showInfo);
			mapClip.getChildByName("GreenButton3").addEventListener(MouseEvent.MOUSE_OVER, showInfo);
			mapClip.getChildByName("GreenButton4").addEventListener(MouseEvent.MOUSE_OVER, showInfo);
			mapClip.getChildByName("GreenButton5").addEventListener(MouseEvent.MOUSE_OVER, showInfo);
			mapClip.getChildByName("GreenButton6").addEventListener(MouseEvent.MOUSE_OVER, showInfo);
			mapClip.getChildByName("GreenButton7").addEventListener(MouseEvent.MOUSE_OVER, showInfo);
			
			
			mapClip.getChildByName("BrownButton1").addEventListener(MouseEvent.MOUSE_OUT, hideInfo);
			mapClip.getChildByName("BrownButton2").addEventListener(MouseEvent.MOUSE_OUT, hideInfo);
			mapClip.getChildByName("BrownButton3").addEventListener(MouseEvent.MOUSE_OUT, hideInfo);
			
			mapClip.getChildByName("GreenButton1").addEventListener(MouseEvent.MOUSE_OUT, hideInfo);
			mapClip.getChildByName("GreenButton2").addEventListener(MouseEvent.MOUSE_OUT, hideInfo);
			mapClip.getChildByName("GreenButton3").addEventListener(MouseEvent.MOUSE_OUT, hideInfo);
			mapClip.getChildByName("GreenButton4").addEventListener(MouseEvent.MOUSE_OUT, hideInfo);
			mapClip.getChildByName("GreenButton5").addEventListener(MouseEvent.MOUSE_OUT, hideInfo);
			mapClip.getChildByName("GreenButton6").addEventListener(MouseEvent.MOUSE_OUT, hideInfo);
			mapClip.getChildByName("GreenButton7").addEventListener(MouseEvent.MOUSE_OUT, hideInfo);
			
				
			addChild(mapSprite);
			
			//[42]
			addChild(levelData);
			levelData.visible = false;
			
			// show locked levels that cannot be played yet
			lockLevels();
			
			
		}
		
		public function showInfo(e:MouseEvent):void
		{
			//TODO: Code the level info loader more efficiently (if possible)
			
			levelData.visible = true;
			var name:String = e.target.name;
			
			switch(name)
			{
				case Constant.BTN_LEVEL1: levelData.showLevelInfo(1); break;
				case Constant.BTN_LEVEL2: levelData.showLevelInfo(2); break;
				case Constant.BTN_LEVEL3: levelData.showLevelInfo(3); break;
				case Constant.BTN_LEVEL4: levelData.showLevelInfo(4); break;
				case Constant.BTN_LEVEL5: levelData.showLevelInfo(5); break;
				case Constant.BTN_LEVEL6: levelData.showLevelInfo(6); break;
				case Constant.BTN_LEVEL7: levelData.showLevelInfo(7); break;
				case Constant.BTN_LEVEL8: levelData.showLevelInfo(8); break;
				case Constant.BTN_LEVEL9: levelData.showLevelInfo(9); break;
				case Constant.BTN_LEVEL10: levelData.showLevelInfo(10); break;
				
				default: trace("FAIL: Name of button not found!"); break;
			}
			
		}
		
		public function hideInfo(e:MouseEvent):void
		{
			levelData.visible = false;
		}
		
		public function map1(e:Event):void {			
			
			levelData.destroy();
			var game:Game = new Game(new Level1(), 1);
			stage.addChild(game);
	
			destroy();
			parent.removeChild(this);
			
		}
		
		public function map2(e:Event):void {
			
			if (PlayerProgress.levelsUnlocked < 2)
				return;
			
			levelData.destroy();
			var game:Game = new Game(new Level2(), 2);
			stage.addChild(game);
	
			destroy();
			parent.removeChild(this);
			
		}
		public function map3(e:Event):void {
			
			if (PlayerProgress.levelsUnlocked < 3)
				return;
			
			levelData.destroy();
			var game:Game = new Game(new Level3(), 3);
			stage.addChild(game);
	

			parent.removeChild(this);
			
		}
		public function map4(e:Event):void {
			
			if (PlayerProgress.levelsUnlocked < 4)
				return;
			
			levelData.destroy();
			var game:Game = new Game(new Level4(), 4);
			stage.addChild(game);
	
			destroy();
			parent.removeChild(this);
			
		}
		
		public function map5(e:Event):void {
			
			if (PlayerProgress.levelsUnlocked < 5)
				return;
			
			levelData.destroy();
			var game:Game = new Game(new Level5(), 5);
			stage.addChild(game);
			
			destroy();
			parent.removeChild(this);
			
		}
		public function map6(e:Event):void {
			
			if (PlayerProgress.levelsUnlocked < 6)
				return;
				
			levelData.destroy();
			var game:Game = new Game(new Level6(),6);
			stage.addChild(game);
	
			destroy();
			parent.removeChild(this);
			
		}
		
		public function map7(e:Event):void {
			
			if (PlayerProgress.levelsUnlocked < 7)
				return;
			
			levelData.destroy();
			var game:Game = new Game(new Level7(),7);
			stage.addChild(game);
	

			parent.removeChild(this);
			
		}
		public function map8(e:Event):void {
			
			if (PlayerProgress.levelsUnlocked < 8)
				return;
			
			levelData.destroy();
			var game:Game = new Game(new Level8(),8);
			stage.addChild(game);
	
			destroy();
			parent.removeChild(this);
			
		}
		
		public function map9(e:Event):void {
			
			if (PlayerProgress.levelsUnlocked < 9)
				return;
			
			levelData.destroy();
			var game:Game = new Game(new Level9(),9);
			stage.addChild(game);
	
			destroy();
			parent.removeChild(this);
			
		}
		
		public function map10(e:Event):void {
			
			if (PlayerProgress.levelsUnlocked < 10)
				return;
			
			levelData.destroy();
			var game:Game = new Game(new Level10(),10);
			stage.addChild(game);
			
			destroy();
			parent.removeChild(this);
			
		}
		
		//[42] GRAYSCALE for locked areas
		public function applyGrayscale(s:String):void
		{
			var mat:Array = [ .33,.33,.33,0,0,
			  .33,.33,.33,0,0,
			  .33,.33,.33,0,0,
			  .33, .33, .33, 1, 0 ];
			  
			var colorMat:ColorMatrixFilter = new ColorMatrixFilter(mat);
			
			mapClip.getChildByName(s).filters = [colorMat];
			mapClip.getChildByName(s).alpha = 0.6;

		}
		
		public function lockLevels():void
		{
			for (var i:int = PlayerProgress.levelsUnlocked; i <= Constant.TOTAL_LEVELS; i++)
			{
					
				switch(i)
				{
					case 0: applyGrayscale(Constant.BTN_LEVEL1); break;
					case 1: applyGrayscale(Constant.BTN_LEVEL2); break;
					case 2: applyGrayscale(Constant.BTN_LEVEL3); break;
					case 3: applyGrayscale(Constant.BTN_LEVEL4); break;
					case 4: applyGrayscale(Constant.BTN_LEVEL5); break;
					case 5: applyGrayscale(Constant.BTN_LEVEL6); break;
					case 6: applyGrayscale(Constant.BTN_LEVEL7); break;
					case 7: applyGrayscale(Constant.BTN_LEVEL8); break;
					case 8: applyGrayscale(Constant.BTN_LEVEL9); break;
					case 9: applyGrayscale(Constant.BTN_LEVEL10); break;
				}
			}
		}
		
		public function destroy():void
		{
			mapClip.getChildByName("BrownButton1").removeEventListener(MouseEvent.CLICK, map1);
			mapClip.getChildByName("BrownButton2").removeEventListener(MouseEvent.CLICK, map2);
			mapClip.getChildByName("BrownButton3").removeEventListener(MouseEvent.CLICK, map3);
			
			mapClip.getChildByName("GreenButton1").removeEventListener(MouseEvent.CLICK, map4);
			mapClip.getChildByName("GreenButton2").removeEventListener(MouseEvent.CLICK, map5);
			mapClip.getChildByName("GreenButton3").removeEventListener(MouseEvent.CLICK, map6);
			mapClip.getChildByName("GreenButton4").removeEventListener(MouseEvent.CLICK, map7);
			mapClip.getChildByName("GreenButton5").removeEventListener(MouseEvent.CLICK, map8);
			mapClip.getChildByName("GreenButton6").removeEventListener(MouseEvent.CLICK, map9);
			mapClip.getChildByName("GreenButton7").removeEventListener(MouseEvent.CLICK, map10);
			
			
			mapClip.getChildByName("BrownButton1").removeEventListener(MouseEvent.MOUSE_OVER, showInfo);
			mapClip.getChildByName("BrownButton2").removeEventListener(MouseEvent.MOUSE_OVER, showInfo);
			mapClip.getChildByName("BrownButton3").removeEventListener(MouseEvent.MOUSE_OVER, showInfo);
			
			mapClip.getChildByName("GreenButton1").removeEventListener(MouseEvent.MOUSE_OVER, showInfo);
			mapClip.getChildByName("GreenButton2").removeEventListener(MouseEvent.MOUSE_OVER, showInfo);
			mapClip.getChildByName("GreenButton3").removeEventListener(MouseEvent.MOUSE_OVER, showInfo);
			mapClip.getChildByName("GreenButton4").removeEventListener(MouseEvent.MOUSE_OVER, showInfo);
			mapClip.getChildByName("GreenButton5").removeEventListener(MouseEvent.MOUSE_OVER, showInfo);
			mapClip.getChildByName("GreenButton6").removeEventListener(MouseEvent.MOUSE_OVER, showInfo);
			mapClip.getChildByName("GreenButton7").removeEventListener(MouseEvent.MOUSE_OVER, showInfo);
			
			
			mapClip.getChildByName("BrownButton1").removeEventListener(MouseEvent.MOUSE_OUT, hideInfo);
			mapClip.getChildByName("BrownButton2").removeEventListener(MouseEvent.MOUSE_OUT, hideInfo);
			mapClip.getChildByName("BrownButton3").removeEventListener(MouseEvent.MOUSE_OUT, hideInfo);
			
			mapClip.getChildByName("GreenButton1").removeEventListener(MouseEvent.MOUSE_OUT, hideInfo);
			mapClip.getChildByName("GreenButton2").removeEventListener(MouseEvent.MOUSE_OUT, hideInfo);
			mapClip.getChildByName("GreenButton3").removeEventListener(MouseEvent.MOUSE_OUT, hideInfo);
			mapClip.getChildByName("GreenButton4").removeEventListener(MouseEvent.MOUSE_OUT, hideInfo);
			mapClip.getChildByName("GreenButton5").removeEventListener(MouseEvent.MOUSE_OUT, hideInfo);
			mapClip.getChildByName("GreenButton6").removeEventListener(MouseEvent.MOUSE_OUT, hideInfo);
			mapClip.getChildByName("GreenButton7").removeEventListener(MouseEvent.MOUSE_OUT, hideInfo);
		}
		
		
		public function restart(e:Event):void {
			
			stage.addChild(new MapSelect());
		}
		
	}

}