package com.agency.client.project.view {
	import com.agency.client.project.model.vo.ResizeVO;
	import com.agency.client.project.signals.ResizeSignal;
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import org.assetloader.core.IAssetLoader;
	import org.osflash.thunderbolt.Logger;
	import org.robotlegs.mvcs.Mediator;




	public class StageMediator extends Mediator {
		[Inject]
		public var view : DisplayObjectContainer;
		[Inject]
		public var assetLoader : IAssetLoader;
		[Inject]
		public var resizeSignal : ResizeSignal;
		
		private var _background : Sprite;
		private var _resizeVO: ResizeVO;



		override public function onRegister() : void {
			// Logger.info("StageMediator.onRegister()");
			
			//Create our resizeVO only once
			_resizeVO = new ResizeVO();
			
			//Background
			_background = new Sprite();
			_background.graphics.beginFill(0xEEEEEE, 1);
			_background.graphics.drawRect(0, 0, view.stage.stageWidth, view.stage.stageHeight);
			_background.graphics.endFill();
			view.addChild(_background);

			// Listen for stage resizes
			view.stage.addEventListener(Event.RESIZE, onResized);
			
			//Lisen for our internal ResizeSignal
			resizeSignal.add(onResize);
		}

		private function onResized(e : Event) : void {
			// Logger.info("StageMediator.onResize(e) : " + view.stage.stageWidth + " / " + view.stage.stageHeight);
			
			//Update the VO 
			_resizeVO.width = view.stage.stageWidth;
			_resizeVO.height = view.stage.stageHeight;
			
			//Send it out to other mediators 
			resizeSignal.dispatch(_resizeVO);
			
		}
		
		private function onResize(r:ResizeVO):void {
			// Logger.info("StageMediator.onResized(r) : " + r.width + " / " + r.height);
			
			_background.width = r.width;
			_background.height= r.height;
			
		}
	}
}
