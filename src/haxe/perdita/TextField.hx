package perdita;

import towser.RenderFunction;
import perdita.model.Textfield;
import towser.html.Event;
import towser.html.Attributes.*;
import towser.html.Events.*;
import towser.html.Html.*;

class TextField
{
    public static function view<Model, Msg>(msg :Textfield -> InputEvent -> Msg, field :Textfield) :RenderFunction<Model, Msg>
    {
        var filledClass = field.value == "" ? "" : " filled";
        return div([class_("p-textfield" + filledClass)], [
            input([oninput(msg.bind(field)), value(new String(field.value))]),
            span([], [text(field.label)])
        ]);
    }
}