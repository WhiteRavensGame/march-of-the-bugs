package  
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	
	/**
	 * ...
	 * @author ...
	 */
	public class LevelInfoTip extends Sprite
	{
		
		[Embed(source = 'Assets/Tooltips/levelInfoPopup.swf', symbol = 'levelInfo')]
		public var cInfo:Class;
		public var sInfo:Sprite = new cInfo();
		public var tooltipInfo:Sprite = new Sprite();
		
		public var scoreField:TextField;
		public var medalField:TextField;
		
		public function LevelInfoTip() 
		{
			tooltipInfo.addChild(sInfo);
			
			scoreField = sInfo.getChildByName("highScoreField") as TextField;
			medalField = sInfo.getChildByName("medalField") as TextField;
			scoreField.text = "0";
			medalField.text = "";
			
			addChild(tooltipInfo);
			addEventListener(Event.ENTER_FRAME, followMouse);
		}
		
		public function followMouse(e:Event):void
		{
			this.x = stage.mouseX;
			this.y = stage.mouseY;
		}
		
		public function showLevelInfo(level:int):void
		{
			
			var levelHighScore:int;
			
			try {
				levelHighScore = PlayerProgress.highScores[level - 1];
				scoreField.text = "" + levelHighScore;
				
				if(levelHighScore >= Constant.PLATINUM_PERCENTAGE * 10)
					medalField.text = "Platinum";
				else if (levelHighScore >= Constant.GOLD_PERCENTAGE * 10)
					medalField.text = "Gold";
				else if (levelHighScore >= Constant.SILVER_PERCENTAGE * 10)
					medalField.text = "Silver";
				else if (levelHighScore >= Constant.BRONZE_PERCENTAGE * 10)
					medalField.text = "Bronze";
				else if (levelHighScore >= 0)
					medalField.text = "Poop";
				
			}catch(e:Error){}
			
			//medalField.text = "";
		}
		
		public function destroy():void
		{
			removeEventListener(Event.ENTER_FRAME, followMouse);
			parent.removeChild(this);
			
		}
		
	}
	
}