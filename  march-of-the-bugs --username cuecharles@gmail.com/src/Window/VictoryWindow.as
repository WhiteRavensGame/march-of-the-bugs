package Window 
{
	import BulletTypes.SprayBullet;
	import flash.display.SimpleButton;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	
	/**
	 * ...
	 * @author ...
	 */
	public class VictoryWindow extends Window
	{
		
		[Embed(source='../Assets/resultWindows.swf', symbol='winWindow')]
		public var cWin:Class;
		public var sWin:Sprite = new cWin();
		public var winWindow:Sprite = new Sprite();
		
		public var retryBtn:SimpleButton;
		public var levelSelectBtn:SimpleButton;
		
		public var ratingText:TextField;
		public var medalText:TextField;
		
		public static var RETRY:String = "RETRY";
		public static var LEVEL_SELECT:String = "LEVEL_SELECT";
		
		public function VictoryWindow(rating:Number) 
		{
			
			winWindow.addChild(sWin);
			
			retryBtn = sWin.getChildByName("btnRetry") as SimpleButton;
			levelSelectBtn = sWin.getChildByName("btnLevelSelect") as SimpleButton;
			
			addChild(winWindow);
			retryBtn.addEventListener(MouseEvent.CLICK, clickRetry);
			levelSelectBtn.addEventListener(MouseEvent.CLICK, clickLevelSelect);
			
			ratingText = sWin.getChildByName("ratingField") as TextField;
			medalText = sWin.getChildByName("medalField") as TextField;
			
			ratingText.text = "" + rating / 10 + "%";
			
			if(rating >= Constant.PLATINUM_PERCENTAGE * 10)
				medalText.text = "PLATINUM!";
			else if (rating >= Constant.GOLD_PERCENTAGE * 10)
				medalText.text = "GOLD";
			else if (rating >= Constant.SILVER_PERCENTAGE * 10)
				medalText.text = "SILVER";
			else if (rating >= Constant.BRONZE_PERCENTAGE * 10)
				medalText.text = "BRONZE";
			else if (rating >= 0)
				medalText.text = "POOP";
				
				
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