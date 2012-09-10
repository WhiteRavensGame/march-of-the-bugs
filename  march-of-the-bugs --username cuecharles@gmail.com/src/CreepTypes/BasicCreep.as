package CreepTypes 
{
	/**
	 * ...
	 * @author Vali
	 */
	
	 //Image embed for the Creep

	public class BasicCreep extends Creep
	{
		[Embed(source='../Assets/roachsprite.png')]
		public var imgCreep:Class;
		
		public function BasicCreep() 
		{
			
			super(30, 10);
			sprite.addChild(new imgCreep());
		}
		
	}

}