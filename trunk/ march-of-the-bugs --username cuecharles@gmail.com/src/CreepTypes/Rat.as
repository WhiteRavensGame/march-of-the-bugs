package CreepTypes 
{
	/**
	 * ...
	 * @author Vali
	 */
	public class Rat extends Creep
	{
		[Embed(source = '../Assets/ratsprite.png')]
		public var imgSprite:Class;
		
		public static var hp:int = 60;
		public static var atk:int = 24;
		public static var def:int = 0;
		public static var mainCost:int = 42;
		public static var speed:int = 5;
		
		public function Rat() 
		{
			super(hp, speed);
			sprite.addChild(new imgSprite());
			super.damage = atk;
			super.cost = mainCost;
		}
		
	}

}