package perdita.model.util;

import haxe.Serializer;
import haxe.Unserializer;

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

	@:keep
	function hxSerialize(s:Serializer) {
		s.serialize(x);
		s.serialize(y);
		s.serialize(x_changed);
		s.serialize(y_changed);
	}

	@:keep
	function hxUnserialize(u:Unserializer) {
		x = u.unserialize();
		y = u.unserialize();
		x_changed = u.unserialize();
		y_changed = u.unserialize();
	}
}