package perdita.model;

import haxe.Serializer;
import haxe.Unserializer;

class AccordianItem
{
	public var title :String;
	public var isOpen :Bool;

	public function new(title :String):Void 
	{
		this.title = title;
		this.isOpen = true;
	}

	public function toggle() : Bool
	{
		this.isOpen = !this.isOpen;
		return true;
	}

	@:keep
	function hxSerialize(s:Serializer) {
		s.serialize(title);
		s.serialize(isOpen);
	}

	@:keep
	function hxUnserialize(u:Unserializer) {
		title = u.unserialize();
		isOpen = u.unserialize();
	}
}