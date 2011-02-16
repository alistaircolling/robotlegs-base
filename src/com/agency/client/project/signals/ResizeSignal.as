package com.agency.client.project.signals {
	import com.agency.client.project.model.vo.ResizeVO;
	import org.osflash.signals.Signal;

	public class ResizeSignal extends Signal {
		
		public function ResizeSignal() {
			super(ResizeVO);
		}
	}
}
