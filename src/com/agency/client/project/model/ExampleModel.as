package com.agency.client.project.model {
	import com.agency.client.project.model.vo.ExampleDataVO;
	import org.osflash.signals.Signal;


	public class ExampleModel {
		
		//SWFaddress url's
		public const DEFAULT : String = "home";
		
		public var onDataSuccsess : Signal;

		public function ExampleModel() {
			init();
		}

		private function init() : void {
			// Logger.info("ExampleModel.init()");

			onDataSuccsess = new Signal();
		}

		public function set exampleData(e : ExampleDataVO) : void {
			
			// Set the data...
			onDataSuccsess.dispatch(e);
			
		}
	}
}
