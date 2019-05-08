package perdita.model;

import haxe.Serializer;
import haxe.Unserializer;

class LineItem
{
	public var isExpanded :Bool;

	public function new(isExpanded :Bool) : Void
	{
		this.isExpanded = isExpanded;
	}

	@:keep
	function hxSerialize(s:Serializer) {
		s.serialize(isExpanded);
	}

	@:keep
	function hxUnserialize(u:Unserializer) {
		isExpanded = u.unserialize();
	}
}