package com.agency.client.project.utils
{
	import com.agency.utils.FlashVarsDynamic;
	import flash.display.DisplayObjectContainer;

	public class FlashVars extends FlashVarsDynamic
	{
		public var basePath : String = "";
		
		[Inject]
		public function FlashVars(contextView : DisplayObjectContainer)
		{
			super(contextView.stage.loaderInfo.parameters);
		}
	}
}
