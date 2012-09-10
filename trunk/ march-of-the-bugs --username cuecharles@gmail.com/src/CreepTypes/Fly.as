package CreepTypes 
{
	/**
	 * ...
	 * @author Vali
	 */
	public class Fly extends Creep
	{
		[Embed(source = '../Assets/FlySprite.png')]
		public var imgSprite:Class;
		
		public static var hp:int = 5;
		public static var atk:int = 3;
		public static var def:int = 0;
		public static var mainCost:int = 8;
		public static var speed:int = 15;
		
		public function Fly() 
		{
			super(hp, speed);
			sprite.addChild(new imgSprite());
			super.damage = atk;
			super.cost = mainCost;
			
			super.isFlying = true;
		}
		
	}

}