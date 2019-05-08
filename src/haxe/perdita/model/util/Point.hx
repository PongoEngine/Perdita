package perdita.model.util;

import haxe.Serializer;
import haxe.Unserializer;

class Point
{
	public var x :Int;
	public var y :Int;

	public function new(x :Int = 0, y :Int = 0) : Void
	{
		this.x = x;
		this.y = y;
	}

	public inline function update(x :Int, y :Int) : Void
	{
		this.x = x;
		this.y = y;
	}

	@:keep
	function hxSerialize(s:Serializer) {
		s.serialize(x);
		s.serialize(y);
	}

	@:keep
	function hxUnserialize(u:Unserializer) {
		x = u.unserialize();
		y = u.unserialize();
	}
}