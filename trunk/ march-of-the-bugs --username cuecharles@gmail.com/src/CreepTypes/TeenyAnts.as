package CreepTypes 
{
	/**
	 * ...
	 * @author Vali
	 */
	public class TeenyAnts extends Creep
	{
		[Embed(source = '../Assets/teenyantsSprite.png')]
		public var imgSprite:Class;
		
		public static var hp:int = 15;
		public static var atk:int = 5;
		public static var def:int = 0;
		public static var mainCost:int = 10;
		public static var speed:int = 15;
		
		public function TeenyAnts() 
		{
			super(hp, speed);
			sprite.addChild(new imgSprite());
			super.damage = atk;
			super.cost = TeenyAnts.mainCost;
		}
		
	}

}