package perdita.model.util;

class PointerPosition
{
	public var x (default, null):Int;
	public var y (default, null):Int;

    public var x_changed :Int;
	public var y_changed :Int;

	public function new(x :Int = 0, y :Int = 0) : Void
	{
		this.x_changed = this.x = x;
		this.y_changed = this.y = y;
	}

	public static inline function update(point :PointerPosition, x :Int, y :Int) : Void
	{
        point.x_changed = x - point.x;
        point.y_changed = y - point.y;
		point.x = x;
		point.y = y;
	}
}