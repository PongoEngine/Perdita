package perdita.model;

import haxe.Serializer;
import haxe.Unserializer;

class Toggle
{
	public var isActive :Bool;

	public function new(isActive :Bool) : Void
	{
		this.isActive = isActive;
	}

	@:keep
	function hxSerialize(s:Serializer) {
		s.serialize(isActive);
	}

	@:keep
	function hxUnserialize(u:Unserializer) {
		isActive = u.unserialize();
	}
}