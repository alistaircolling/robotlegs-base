package com.agency.client.project.controller {
	import com.agency.client.project.model.ExampleModel;
	import com.agency.client.project.services.ExampleService;
	import org.assetloader.core.IAssetLoader;
	import org.osflash.thunderbolt.Logger;
	import org.robotlegs.mvcs.SignalCommand;


	public class AssetsCompleteCommand extends SignalCommand {
		[Inject]
		public var assetLoader : IAssetLoader;
		[Inject]
		public var exampleService : ExampleService;
		[Inject]
		public var exampleModel : ExampleModel;

		override public function execute() : void {
			Logger.info("AssetsCompleteCommand.execute()");
			
			//Map the response of ExampleModel's sucessfull data request to the DataCompleteCommand
			signalCommandMap.mapSignal(exampleModel.onDataSuccsess, DataCompleteCommand);
			
			//Ask the db for our data to populate the map and worlds
			exampleService.getData();
			
		}
	}
}
