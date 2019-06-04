package perdita.model;

class AccordianItem
{
	public var title :String;
	public var isOpen :Bool;

	public function new(title :String):Void 
	{
		this.title = title;
		this.isOpen = true;
	}

	public static function toggle(item :AccordianItem) : Bool
	{
		item.isOpen = !item.isOpen;
		return true;
	}
}