package  
{
	import flash.net.SharedObject;
	
	/**
	 * ...
	 * @author ...
	 */
	public class DataManager 
	{
		//this class will manage saving and loading of the game data
		
		private static var _sharedObject:SharedObject;
		
		public function DataManager() 
		{
			
		}
		
		public static function loadOldData():void
		{
			
			// opens the SharedObject
			try{
				_sharedObject = SharedObject.getLocal("PlayerSaveData");
			}catch (e:Error){
				trace("SharedObject Error:"+e.toString());
				return;
			}
			
			trace("LOADING DATA...");
			
			// loads the data from the Shared Object
			PlayerProgress.levelsUnlocked = _sharedObject.data.levelsUnlocked;
			PlayerProgress.highScores = _sharedObject.data.highScores;
			PlayerProgress.bugsUnlocked = _sharedObject.data.bugsUnlocked;
			
			// close the Shared Object Connection to avoid crashing
			_sharedObject.close();
			
		}
		
		public static function saveData():void
		{
			// opens the SharedObject
			try{
				_sharedObject = SharedObject.getLocal("PlayerSaveData");
			}catch (e:Error){
				trace("SharedObject Error:"+e.toString());
				return;
			}
			
			trace("SAVING DATA...");
			
			// stores the data in a Shared Object
			_sharedObject.data.levelsUnlocked = PlayerProgress.levelsUnlocked;
			_sharedObject.data.highScores = PlayerProgress.highScores;
			_sharedObject.data.bugsUnlocked = PlayerProgress.bugsUnlocked;
			
			// closes connection
			_sharedObject.close();
		}
		
	}
	
}