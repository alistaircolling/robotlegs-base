package com.agency.client.project.model.vo {
	public class ResizeVO {
		private var _width : int;
		private var _height : int;
		
		public function ResizeVO(w:int = 0, h:int = 0):void {
			width = w;
			height = h;
		}
		
		public function get width() : int {
			return _width;
		}

		public function set width(value : int) : void {
			_width = value;
		}

		public function get height() : int {
			return _height;
		}

		public function set height(value : int) : void {
			_height = value;
		}
	}
}
