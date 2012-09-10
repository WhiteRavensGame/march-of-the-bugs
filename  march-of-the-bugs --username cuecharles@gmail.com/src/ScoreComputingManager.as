package  
{
	
	/**
	 * ...
	 * @author ...
	 */
	public class ScoreComputingManager 
	{
		
		public function ScoreComputingManager() 
		{
			
		}
		
		public static function computeRating(rating:Number):int
		{
			//returns the decimal version of the rating into a three-digit number score (0-1000)
			
			return rating * 1000; // takes three digits of the decimal
		}
		
	}
	
}