package perdita.model;

import perdita.model.util.UUID;

class Drawer
{
	public var width (default, null) :Int;
	public var isOpen (default, null) :Bool;
	public var isLeft (default, null) :Bool;
	public var isActive :Bool;
	public var id (default, null) :DrawerId;

	public function new(isLeft :Bool, id :DrawerId):Void 
	{
		this.width = 400;
		this.isOpen = true;
		this.isLeft = isLeft;
		this.isActive = false;
		this.id = id;
	}

	public static function stretchBy(drawer :Drawer, val :Int) : Bool
	{
		var dist = drawer.isLeft ? val : val * -1;
		drawer.width += dist;
		drawer.isOpen = true;

		if(drawer.width < COLLAPSING_WIDTH) {
			drawer.isOpen = false;
		}
		return true;
	}

	public static function checkWidth(drawer :Drawer) : Void
	{
		if(drawer.width < COLLAPSING_WIDTH) {
			drawer.width = MIN_WIDTH;
		}
	}

	public static function close(drawer :Drawer) : Void
	{
		drawer.width = MIN_WIDTH;
		drawer.isOpen = false;
	}

	public static function open(drawer :Drawer, width :Int) : Void
	{
		drawer.width = width;
		drawer.isOpen = true;
	}

	public static inline var MIN_WIDTH :Int = 16;
	public static inline var COLLAPSING_WIDTH :Int = 120;
}