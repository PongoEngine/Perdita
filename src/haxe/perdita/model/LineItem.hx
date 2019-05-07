package perdita.model;

class LineItem
{
	public var title :String;
	public var isExpanded :Bool;

	public function new(title :String, isExpanded :Bool) : Void
	{
		this.title = title;
		this.isExpanded = isExpanded;
	}
}