package  
{
	import com.agency.client.project.RobotLegsBase;
	import flash.display.Sprite;

	[SWF(backgroundColor="#FFFFFF", frameRate="31", width="620", height="480")]

	public class Main extends Sprite 
	{
		protected var _context : RobotLegsBase;

		public function Main()
		{
			_context = new RobotLegsBase(this);
		}
	}
}
