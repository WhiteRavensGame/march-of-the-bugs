package Window 
{
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	/**
	 * ...
	 * @author ...
	 */
	public class LoseWindow extends Window
	{
		[Embed(source = '../Assets/resultWindows.swf', symbol = 'failWindow')]
		public var cFail:Class;
		public var sFail:Sprite = new cFail();
		public var failWindow:Sprite = new Sprite();
		
		public var retryBtn:SimpleButton;
		public var levelSelectBtn:SimpleButton;
		
		public static var RETRY:String = "RETRY";
		public static var LEVEL_SELECT:String = "LEVEL_SELECT";
		
		public function LoseWindow() 
		{
			failWindow.addChild(sFail);
			
			retryBtn = sFail.getChildByName("btnRetry") as SimpleButton;
			levelSelectBtn = sFail.getChildByName("btnLevelSelect") as SimpleButton;
			
			addChild(failWindow);
			retryBtn.addEventListener(MouseEvent.CLICK, clickRetry);
			levelSelectBtn.addEventListener(MouseEvent.CLICK, clickLevelSelect);
			
			super();
			
		}
		
		public function clickRetry(e:MouseEvent):void
		{
			dispatchEvent(new Event(RETRY));
			destroy();
		}
		public function clickLevelSelect(e:MouseEvent):void
		{
			dispatchEvent(new Event(LEVEL_SELECT));
			destroy();
		}
		
		
		public function destroy():void
		{
			retryBtn.removeEventListener(MouseEvent.CLICK, clickRetry);
			levelSelectBtn.removeEventListener(MouseEvent.CLICK, clickLevelSelect);
			retryBtn = null;
			levelSelectBtn = null;
			parent.removeChild(this);
		}
		
	}
	
}