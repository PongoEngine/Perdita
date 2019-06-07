package perdita.model;

class Textfield
{
	public var label :String;
	public var value :String;
	public var isValid :Bool;

	public function new(label :String, value :String, isValid :Bool) : Void
	{
		this.label = label;
		this.value = value;
		this.isValid = isValid;
	}
}