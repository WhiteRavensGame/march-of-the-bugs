package CreepTypes 
{
	/**
	 * ...
	 * @author Vali
	 */
	public class ToughCreep extends Creep
	{
		
		[Embed(source='../Assets/toughEnemy.png')]
		public var imgCreep:Class;
		
		public function ToughCreep() 
		{
			
			super(90, 5);
			super.cost = 10;
			sprite.addChild(new imgCreep());
		}
		
	}

}