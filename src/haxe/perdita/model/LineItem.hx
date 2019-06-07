package perdita.model;

import perdita.model.util.UUID.LineItemId;

class LineItem
{
	public var isExpanded :Bool;
	public var id :LineItemId;

	public function new(isExpanded :Bool, id :LineItemId) : Void
	{
		this.isExpanded = isExpanded;
		this.id = id;
	}
}