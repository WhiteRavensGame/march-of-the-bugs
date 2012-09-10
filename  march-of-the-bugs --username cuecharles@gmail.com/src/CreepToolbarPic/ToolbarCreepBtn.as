package CreepToolbarPic 
{
	import flash.display.Sprite;
	import flash.text.TextField;
	
	/**
	 * ...
	 * @author ...
	 */
	public class ToolbarCreepBtn extends Sprite
	{
		
		//[Embed(source='../Assets/toolbarClickableV2.swf', symbol='bugButtonFinal')]
		[Embed(source='../Assets/toolbarClickableV2.swf', symbol='bugButtonFinal')]
		public var cButton:Class;
		public var sButton:Sprite = new cButton();
		//public var sButton:Sprite = dummy.getChildAt(0) as Sprite;
		
		public var nameField:TextField = sButton.getChildByName("bugName") as TextField;
		public var atkField:TextField = sButton.getChildByName("atkField") as TextField;
		public var defField:TextField = sButton.getChildByName("defField") as TextField;
		public var hpField:TextField = sButton.getChildByName("hpField") as TextField;
		public var costField:TextField = sButton.getChildByName("costField") as TextField;
		
		public function ToolbarCreepBtn(name:String, atk:int, def:int, hp:int, cost:int) 
		{
			nameField.text = "" + name;
			atkField.text = "" + atk;
			defField.text = "" + def;
			hpField.text = "" + hp;
			costField.text = "" + cost;
			
			//for (var i:int = 0; i < sButton.numChildren; i++)
			//{
				//trace(sButton.getChildAt(i).name);
			//}
			
			this.scaleY = 1.05;
			
			
			addChild(sButton);
			
		}
		
	}
	
}