package com.agency.client.project.view {
	import com.agency.client.project.model.vo.ResizeVO;
	import com.agency.client.project.signals.ResizeSignal;
	import com.agency.utils.SWFAddress;
	import org.assetloader.core.IAssetLoader;
	import org.robotlegs.mvcs.Mediator;


	public class PreloaderMediator extends Mediator {
		
		[Inject]
		public var view : Preloader;
		[Inject]
		public var assetLoader : IAssetLoader;
		[Inject]
		public var swfAddress : SWFAddress;
		[Inject]
		public var resizeSignal : ResizeSignal;

		override public function onRegister() : void {
			// Logger.info("PreloaderMediator.onRegister()");
			
			view.init();
			
			//TODO replace with 'real' preloader logic
			view.progress.width = view.stage.stageWidth * .75; 
			view.progress.x = (view.stage.stageWidth *.5 - view.progress.width *.5 );
			view.progress.y = (view.stage.stageHeight *.5 - view.progress.height *.5 );
			

			// Map the progress to the view's progress
			assetLoader.onProgress.add(view.onProgress);
			
			// Resize handler
			resizeSignal.add(onResize); 
			
			// SWFAddress handler
			swfAddress.change.add(onChange);
			
		}

		private function onResize(r:ResizeVO):void {
			// Logger.info("PreloaderMediator.onResized(r) : " + r.width + " / " + r.height);
			
			//TODO replace with 'real' preloader logic
			view.progress.width = r.width * .75; 
			view.progress.x = (r.width *.5 - view.progress.width *.5 );
			view.progress.y = (r.height *.5 - view.progress.height *.5 );
			
		}

		private function onChange() : void {
			// Logger.info("PreloaderMediator.onChange(s)");
			
			//TODO replace with 'real' preloader logic
			if (view.progress.visible) view.destroy();		
			
		}
	}
}
