package  
{
	/**
	 * ...
	 * @author Vali
	 */
	
	/*
	 * Class used to for damage multipliers for each creep.
	 */ 
	public class DamageMultiplier
	{
		
		public var impact:Number = 0;
		public var poison:Number = 0;
		public var explosive:Number = 0;
		public var zap:Number = 0;
		public var freeze:Number = 0 ;
		public var bleed:Number = 0;
		public function DamageMultiplier(impact:Number = 0, poison:Number = 0, explosive:Number = 0, zap:Number = 0, freeze:Number = 0, bleed:Number = 0) 
		{
			this.impact = impact;
			this.poison = poison;
			this.explosive = explosive;
			this.zap = zap;
			this.freeze = freeze;
			this.bleed = bleed;
		}
		
	}

}