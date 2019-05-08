package perdita.model;

import haxe.Serializer;
import haxe.Unserializer;

class Textfield
{
	public var label :String;
	public var value :String;

	public function new(label :String, value :String) : Void
	{
		this.label = label;
		this.value = value;
	}

	@:keep
	function hxSerialize(s:Serializer) {
		s.serialize(label);
		s.serialize(value);
	}

	@:keep
	function hxUnserialize(u:Unserializer) {
		label = u.unserialize();
		value = u.unserialize();
	}
}