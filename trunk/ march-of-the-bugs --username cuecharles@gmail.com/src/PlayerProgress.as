package  
{
	import flash.display.DisplayObject;
	import flash.net.SharedObject;
	
	/**
	 * ...
	 * @author ...
	 */
	public class PlayerProgress 
	{
		
		// This class will store all the progress the player has made
		
		
		
		public static var levelsUnlocked:int = 1;
		
		public static var highScores:Array = 
		[42,0,0,0,0,
		 0,0,0,0,0];
		
		
		public static var bugsUnlocked:Array = 
		[1,0,0,0,0,
		 0,0,0,0,0,
		 0,0,0,0,0,
		 0,0,0,0,0,
		 0,0,0,0,0];
		
		public function PlayerProgress() 
		{
			
		}
		
		public static function checkLevelUnlockRewards():void
		{
			//CURRENTLY ASSUMES that all bugs are unlocked by level up
			for (var i:int = 0; i < Constant.LVLUNLOCK_BUGS.length; i++)
			{
				if (levelsUnlocked >= Constant.LVLUNLOCK_BUGS[i])
					bugsUnlocked[i] = 1;
				else
					break; // ahh brute force
			}
		}
		
		
		
	}
	
}