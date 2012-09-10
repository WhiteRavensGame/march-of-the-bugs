package  
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField;
	/**
	 * ...
	 * @author Vali
	 */
	public class TurretStatBox extends Sprite
	{
		
		[Embed(source = 'Assets/turretTooltip.swf', symbol = 'turretTip')]
		public var cTip:Class;
		public var sTip:Sprite = new cTip();
		public var sBg:Sprite = new Sprite();
		
		public var nameField:TextField = sTip.getChildByName("nameField") as TextField;
		public var damageField:TextField = sTip.getChildByName("atkField") as TextField;
		public var speedField:TextField = sTip.getChildByName("rateField") as TextField;
		public var descriptionField:TextField = sTip.getChildByName("descriptionField") as TextField;
		public var rangeField:TextField = sTip.getChildByName("rangeField") as TextField;
		
		public function TurretStatBox() 
		{
			sBg.addChild(sTip);
			
			nameField.text = "";
			damageField.text = "";
			speedField.text = "";
			descriptionField.text = "";
			rangeField.text = "";
			
			addChild(descriptionField);
			
			addEventListener(Event.ENTER_FRAME, followMouse);
			addChild(sBg);
		}
		
		public function followMouse(e:Event):void
		{
			this.x = stage.mouseX;
			this.y = stage.mouseY;
			
			//currently brute-forced way of fixing description to stay in game's bounds
			if (this.x + this.width > 800)
				this.x -= this.width;
			else if (this.y + this.height > 450)
				this.y -= this.height;
		}
		
		public function updateFields(turret:Turret):void
		{
			nameField.text = "" + turret.turretName;
			damageField.text = "" + turret.damage;
			speedField.text = "" + (turret.speed / 60);
			descriptionField.text = "" + turret.description;
			
			//TODO: Fix the flag to support AIR, GROUND, AIR/GROUND, and whatever future effectors
			if (turret.reachFlying)
				rangeField.text = "ALL";
			else
				rangeField.text = "GROUND";
		}
		
		public function destroy():void
		{
			removeEventListener(Event.ENTER_FRAME, followMouse);
			removeChild(sBg);
			sTip = null;
			sBg = null;
			
			parent.removeChild(this);
		}
		
	}

}