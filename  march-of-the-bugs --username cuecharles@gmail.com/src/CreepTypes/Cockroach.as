package CreepTypes 
{
	/**
	 * ...
	 * @author Vali
	 */
	public class Cockroach extends Creep
	{
		[Embed(source='../Assets/roachsprite.png')]
		public var imgCreep:Class;
		
		public static var hp:int = 20;
		public static var atk:int = 12;
		public static var def:int = 0;
		public static var mainCost:int = 12;
		public static var speed:int = 8;
		
		
		public function Cockroach() 
		{
			super(hp, speed);
			sprite.addChild(new imgCreep());
			super.damage = atk;
			super.cost = mainCost;
		}
		
	}

}