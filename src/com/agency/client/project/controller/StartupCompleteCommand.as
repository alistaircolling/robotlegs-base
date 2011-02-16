package com.agency.client.project.controller {
	import com.agency.client.project.utils.FlashVars;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import org.assetloader.core.IAssetLoader;
	import org.osflash.thunderbolt.Logger;
	import org.robotlegs.mvcs.SignalCommand;



	public class StartupCompleteCommand extends SignalCommand {
		[Inject]
		public var assetLoader : IAssetLoader;
		[Inject]
		public var flashvars : FlashVars;

		override public function execute() : void {
			Logger.info("StartupCompleteCommand.execute()");
			
			contextView.stage.scaleMode = StageScaleMode.NO_SCALE;
			contextView.stage.align = StageAlign.TOP_LEFT;

			// Load up our config.xml
			assetLoader.addConfig(flashvars.basePath + "assets/config.xml");

			// Map the onConfigLaoded to then kick off loading the 'real' asssets
			signalCommandMap.mapSignal(assetLoader.onConfigLoaded, ConfigCompleteCommand);

			// Kick off the inial config load
			assetLoader.start();
		}
	}
}
