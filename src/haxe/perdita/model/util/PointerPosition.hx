package perdita.model.util;

class PointerPosition
{
	public var x (default, null):Int;
	public var y (default, null):Int;

    public var x_changed (default, null):Int;
	public var y_changed (default, null):Int;

	public function new(x :Int = 0, y :Int = 0) : Void
	{
		this.x_changed = this.x = x;
		this.y_changed = this.y = y;
	}

	public inline function update(x :Int, y :Int) : Void
	{
        x_changed = x - this.x;
        y_changed = y - this.y;
		this.x = x;
		this.y = y;
	}
}