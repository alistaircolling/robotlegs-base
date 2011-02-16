package com.agency.client.project {
	import com.agency.client.project.controller.StartupCompleteCommand;
	import com.agency.client.project.model.ExampleModel;
	import com.agency.client.project.services.ExampleService;
	import com.agency.client.project.signals.ResizeSignal;
	import com.agency.client.project.utils.FlashVars;
	import com.agency.client.project.view.Preloader;
	import com.agency.client.project.view.PreloaderMediator;
	import com.agency.client.project.view.StageMediator;
	import com.agency.utils.SWFAddress;
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	import org.assetloader.AssetLoader;
	import org.assetloader.core.IAssetLoader;
	import org.robotlegs.base.ContextEvent;
	import org.robotlegs.mvcs.SignalContext;



	public class RobotLegsBase extends SignalContext {
		
		public function RobotLegsBase(contextView : DisplayObjectContainer = null, autoStartup : Boolean = true) {
			super(contextView, autoStartup);
		}

		override public function startup() : void {
			// Commands
			commandMap.mapEvent(ContextEvent.STARTUP_COMPLETE, StartupCompleteCommand, ContextEvent, true);

			// Services
			injector.mapSingletonOf(IAssetLoader, AssetLoader);
			injector.mapSingleton(SWFAddress);
			
			// Models
			injector.mapSingleton(ExampleModel);
			
			// Services
			injector.mapSingleton(ExampleService);
			
			//Signals
			injector.mapSingleton(ResizeSignal);
			
			// Utils
			injector.mapSingleton(FlashVars);
			
			// Views
			mediatorMap.mapView(contextView, StageMediator);
			mediatorMap.mapView(Preloader, PreloaderMediator);
			
			// Dispatches ContextEvent.STARTUP_COMPLETE
			super.startup();
		}
	}
}
