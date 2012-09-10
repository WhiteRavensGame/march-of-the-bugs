package CustomEvents 
{
	import flash.events.Event;
	
	/**
	 * ...
	 * @author ...
	 */
	
	 // THIS IS NOT WORKING PROPERLY!
	 
	public class LevelLoadEvent extends Event 
	{
		
		public static var NEXT_LEVEL:String = "NEXT_LEVEL";
		public static var RETRY_LEVEL:String = "RETRY_LEVEL";
		public var level:int;
		
		public function LevelLoadEvent(type:String, levelToLoad:int, bubbles:Boolean=false, cancelable:Boolean=false) 
		{ 
			level = levelToLoad;
			
			super(type, bubbles, cancelable);
			
		} 
		
		public override function clone():Event 
		{ 
			return new LevelLoadEvent(type, level, bubbles, cancelable);
		} 
		
		public override function toString():String 
		{ 
			return formatToString("LevelLoadEvent", "type", "bubbles", "cancelable", "eventPhase"); 
		}
		
	}
	
}