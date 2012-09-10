package CreepTypes 
{
	/**
	 * ...
	 * @author Vali
	 */
	public class BlackAnt extends Creep
	{
		[Embed(source = '../Assets/BlackAntSprite.png')]
		public var imgCreep:Class;
		
		public static var hp:int = 20;
		public static var atk:int = 14;
		public static var def:int = 0;
		public static var mainCost:int = 18;
		public static var speed:int = 12;
		
		public function BlackAnt() 
		{
			super(hp, speed);
			sprite.addChild(new imgCreep());
			super.damage = atk;
			super.cost = mainCost;

		}
		
	}

}