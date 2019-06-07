package perdita.model.util;

class UUID
{
	static var UID_CHARS = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz-_=+[]();:.,{}";

	public static inline function drawerId(?size : Int) : DrawerId
	{
		return new DrawerId(random(size));
	}

	public static inline function windowId(?size : Int) : WindowId
	{
		return new WindowId(random(size));
	}

	public static inline function lineItemId(?size : Int) : LineItemId
	{
		return new LineItemId(random(size));
	}

	private static function random(?size : Int) : String
	{
		if(size == null) size = 32;
		var nchars = UID_CHARS.length;
		var uid = new StringBuf();
		for (i in 0 ... size){
			uid.addChar(UID_CHARS.charCodeAt( Std.random(nchars) ));
		}
		return uid.toString();
	}
}

abstract DrawerId(String) {
	public inline function new(id :String) {
		this = id;
	}

	public inline function toString() return this;
}

abstract WindowId(String) {
	public inline function new(id :String) {
		this = id;
	}

	public inline function toString() return this;
}

abstract LineItemId(String) {
	public inline function new(id :String) {
		this = id;
	}

	public inline function toString() return this;
}