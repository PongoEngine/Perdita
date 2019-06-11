package perdita.model;

import js.Browser.window;
import perdita.model.util.Point;
import perdita.model.util.UUID;

class Window
{
    public var position (default, null) :Point;
    public var dimensions (default, null) :Point;
    public var isUpdatingWidth :Bool;
    public var id (default, null) :WindowId;
    public var zIndex :Int;

	public function new(id :WindowId, zIndex :Int) : Void
	{
        this.position = new Point(100, 100);
        this.dimensions = new Point(300, 300);
        this.isUpdatingWidth = false;
        this.id = id;
        this.zIndex = zIndex;
	}

    public static function resizeTo(thisWindow :Window, x :Int, y :Int) : Void
    {
        var width = (x - thisWindow.position.x) + 6;
        var height = y - thisWindow.position.y + 6;

        thisWindow.dimensions.x = Std.int(Math.max(60, width));
        thisWindow.dimensions.y = Std.int(Math.max(80, height));
    }

    public static function moveBy(thisWindow :Window, x :Int, y :Int) : Void
    {
        thisWindow.position.x += x;
        thisWindow.position.y += y;
    }
}