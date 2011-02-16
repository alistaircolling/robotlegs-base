package com.agency.client.project.controller {
	import com.agency.client.project.model.ExampleModel;
	import com.agency.utils.SWFAddress;
	import org.assetloader.core.IAssetLoader;
	import org.osflash.thunderbolt.Logger;
	import org.robotlegs.mvcs.SignalCommand;


	public class DataCompleteCommand extends SignalCommand {
		[Inject]
		public var assetLoader : IAssetLoader;
		[Inject]
		public var exampleModel : ExampleModel;
		[Inject]
		public var swfAddress : SWFAddress;

		override public function execute() : void {
			Logger.info("DataCompleteCommand.execute()");
			
			// If there is no deeplink then default it to map
			// Else kick off a change signal to go to the right section ( most likely a pledge category )
			if (swfAddress.getPathNames().length < 1 ) {
				swfAddress.setValue(exampleModel.DEFAULT);
			} else {
				swfAddress.change.dispatch();
			}

		}
	}
}
