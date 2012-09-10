package CreepTypes 
{
	/**
	 * ...
	 * @author JR-kyun
	 */
	public class DungBeetle extends  Creep
	{
		
		public function DungBeetle() //Dung ball to be added
		{
			super(30, 15);
			super.cost = 80;
			super.damage = super.cost; //This is it for now...
		}
		
	}

}