package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	
	
	/**
	 * ...
	 * @author Vali
	 */
	public class Main extends Sprite 
	{
		[Embed(source = 'Assets/title_screen/pressanyekey.png')]
		public var pressImg:Class;
		[Embed(source = 'Assets/title_screen/Title Screen.png')]
		public var titleImg:Class;
		
		public var titleSprite:Sprite = new Sprite();
		public var pressSprite:Sprite = new Sprite();
		public var pulseFlag:Boolean = true;
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			titleSprite.addChild(new titleImg());
			pressSprite.addChild(new pressImg());
			addChild(titleSprite);
			titleSprite.addChild(pressSprite);
			pressSprite.x = 250;
			pressSprite.y = 450
			
			//[42] loading the data of the player
			//TODO: This bugs when the game is first played by the player. Make a fix that does not load the data when player first plays...
			if(!Constant.START_FROM_BEGINNING)
				DataManager.loadOldData();
			
			stage.addEventListener(KeyboardEvent.KEY_DOWN, gameStart);	
			stage.addEventListener(Event.ENTER_FRAME, pulse);
				
		}
		private function pulse(e:Event):void {
			if (pulseFlag) {
				pressSprite.alpha -= .02;
				if (pressSprite.alpha <= .1) {
					pulseFlag = false;
				}
				
			}else {
				pressSprite.alpha += .02;
				if (pressSprite.alpha >= 1) {
					pulseFlag = true;
				}
			}
		}
		
		private function gameStart(e:Event):void {
			stage.removeEventListener(KeyboardEvent.KEY_DOWN, gameStart);
			stage.removeEventListener(Event.ENTER_FRAME, pulse);
			removeChild(titleSprite);
			var map_select:MapSelect = new MapSelect();
			addChild(map_select);
		}
		
		
	}
	
}