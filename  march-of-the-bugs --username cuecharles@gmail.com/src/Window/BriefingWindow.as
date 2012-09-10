package Window 
{
	import flash.display.SimpleButton;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	
	/**
	 * ...
	 * @author ...
	 */
	public class BriefingWindow extends Window.Window
	{
		
		[Embed(source='../Assets/briefingWindow.swf', symbol='briefingWindow')]
		public var cBrief:Class;
		public var sBrief:Sprite = new cBrief();
		public var briefWindow:Sprite = new Sprite();
		
		public var startBtn:SimpleButton;
		
		public var descriptionField:TextField;
		public var resourcesField:TextField;
		
		
		public static var START:String = "START";
		
		public function BriefingWindow(description:String, resources:int) 
		{
			briefWindow.addChild(sBrief);
			
			startBtn = sBrief.getChildByName("btnStart") as SimpleButton;
			descriptionField = sBrief.getChildByName("descriptionField") as TextField;
			resourcesField = sBrief.getChildByName("resourcesField") as TextField;
			
			//for (var i:int = 0; i < sBrief.numChildren; i++)
			//{
				//trace(sBrief.getChildAt(i).name + "");
			//}
			
			
			addChild(briefWindow);
			
			startBtn.addEventListener(MouseEvent.CLICK, clickStart);
			
			descriptionField.text = description + "";
			resourcesField.text = resources + "";
			
			super();
			
		}
		
		public function clickStart(e:MouseEvent):void
		{
			dispatchEvent(new Event(START));
			destroy();
			
		}
		
		
		public function destroy():void
		{
			startBtn.removeEventListener(MouseEvent.CLICK, clickStart);
			startBtn = null;
			parent.removeChild(this);
		}
		
	}
	
}