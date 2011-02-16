package com.agency.client.project.controller {
	import com.agency.client.project.view.Preloader;
	import org.assetloader.core.IAssetLoader;
	import org.osflash.thunderbolt.Logger;
	import org.robotlegs.mvcs.SignalCommand;


	public class ConfigCompleteCommand extends SignalCommand {
		[Inject]
		public var assetLoader : IAssetLoader;

		override public function execute() : void {
			Logger.info("ConfigCompleteCommand.execute()");
			
			// Map the complete command to AssetsCompleteCommand ( eg after all the assets are loaded )
			signalCommandMap.mapSignal(assetLoader.onComplete, AssetsCompleteCommand);
			
			// Add the preloader so that it can lisen for loading progress
			contextView.addChild(new Preloader());

			// Kick off the rest of the assets
			assetLoader.start();
		}
	}
}
