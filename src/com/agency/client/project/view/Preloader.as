package com.agency.client.project.view {
	import com.bit101.components.ProgressBar;
	import com.greensock.TweenMax;
	import com.greensock.easing.Expo;

	import org.assetloader.signals.ProgressSignal;

	import flash.display.Sprite;

	public class Preloader extends Sprite {
		public var progress : ProgressBar;

		public function Preloader() {
		}

		public function init() : void {
			// Logger.info("Preloader.init()");

			progress = new ProgressBar(this);
			progress.alpha = 0;
			addChild(progress);

			TweenMax.to(progress, 0.25, {autoAlpha:1, ease:Expo.easeOut});
		}

		public function onProgress(s : ProgressSignal) : void {
			// Logger.info("Preloader.onProgress()");

			progress.value = s.progress;
		}

		public function destroy() : void {
			TweenMax.to(progress, 0.25, {autoAlpha:0, ease:Expo.easeOut});
		}
	}
}
