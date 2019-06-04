package perdita.model.util;

class Point
{
	public var x :Int;
	public var y :Int;

	public function new(x :Int = 0, y :Int = 0) : Void
	{
		this.x = x;
		this.y = y;
	}

	public static inline function update(point :Point, x :Int, y :Int) : Void
	{
		point.x = x;
		point.y = y;
	}
}