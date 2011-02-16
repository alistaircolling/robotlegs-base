package com.agency.client.project.services {
	import com.agency.client.project.model.ExampleModel;
	import com.agency.client.project.model.vo.ExampleDataVO;
	import org.osflash.signals.Signal;


	public class ExampleService {
		
		[Inject]
		public var exampleModel : ExampleModel;
		
		public var onDataSuccsess : Signal;

		public function ExampleService() {
		}
		
		public function getData(): void {
			// Logger.info("ExampleService.getDate()");
				
			//Go to the db and get the data
			var e : ExampleDataVO = new ExampleDataVO();
			exampleModel.exampleData = e;	
		}
	}
}
