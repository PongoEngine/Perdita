package perdita;

import towser.RenderFunction;
import perdita.model.Textfield;
import perdita.model.AccordianItem;
import perdita.model.Drawer;
import perdita.model.LineItem;
import perdita.model.Toggle;
import perdita.model.Window;
import towser.html.Event;
import towser.html.Attributes.*;
import towser.html.Events.*;
import towser.html.Html.*;

import engine.Model;
import engine.Update;

class Perdita
{
    public static function textfield(msg :Textfield -> InputEvent -> GenMsg, field :Textfield) :RenderFunction<Model, GenMsg>
    {
        var filledClass = field.value == "" ? "" : " filled";
        return div([class_("p-textfield" + filledClass)], [
            input([oninput(msg.bind(field)), value(new String(field.value))]),
            span([], [text(field.label)])
        ]);
    }

    public static function accordianItem(toggleWindow :AccordianItem -> MouseEvent -> GenMsg, window :AccordianItem, children :Array<RenderFunction<Model, GenMsg>>) : RenderFunction<Model, GenMsg> 
    {
        var heightClass = window.isOpen ? " open" : "";
        var arrow = window.isOpen ? "▼ " : "▶ ";

        var content = window.isOpen ? 
            [
                h1([class_("p-accordianItem-title"), onclick(toggleWindow.bind(window))], [text(arrow + window.title)]),
                div([], children)
            ] : [h1([class_("p-accordianItem-title"), onclick(toggleWindow.bind(window))], [text(arrow + window.title)])];

        return div([class_("p-accordianItem color-container-lighter border-bottom" + heightClass)], content);
    }

    public static function drawer(stretch :Drawer -> MouseEvent -> GenMsg, toggle :Drawer -> MouseEvent -> GenMsg, drawer :Drawer, children :Array<RenderFunction<Model, GenMsg>>) : RenderFunction<Model, GenMsg> 
    {
        var openClass = drawer.isOpen ? " open" : " closed";
        var content = drawer.isOpen 
            ? div([class_("flex-column p-drawer-content color-container border-left border-right")], children)
            : div([], []);
        var leftClass = drawer.isLeft ? " left" : "";
        var activeClass = drawer.isActive ? " active" : "";

        var innerConent = [
            h1([class_("p-drawer-collapser toggler color-actionable" + activeClass), onmousedown(stretch.bind(drawer)), ondblclick(toggle.bind(drawer))], [text("⋮")]),
            content,
            div([class_("p-drawer-collapser barrier")], [])
        ];
        if(drawer.isLeft) {
            innerConent.reverse();
        }

        return div([
            class_("p-drawer color-container flex-row border-right border-left" + openClass + leftClass), 
            style({width: drawer.width + "px"})
        ], innerConent);
    }

    public static function toggle(toggleButton :Toggle -> GenMsg, button :Toggle) : RenderFunction<Model, GenMsg> 
    {
        return label([class_("p-switch")], [
            input([type("checkbox"), checked(button.isActive)]),
            span([], [text("")])
        ]);
    }

    public static function window(selectWindow :Window -> Bool -> MouseEvent -> GenMsg, window :Window, children :Array<RenderFunction<Model, GenMsg>>) : RenderFunction<Model, GenMsg> 
    {
        return div([
            class_("p-window color-container"), 
            onmousedown(selectWindow.bind(window, false)),
            style({
                left: window.position.x + "px", 
                top: window.position.y + "px",
                width: window.dimensions.x + "px",
                height: window.dimensions.y + "px"
            })
        ], [
            div([class_("p-window-bar color-container-darker border-bottom")], []),
            div([class_("flex-column")], children),
            div([
                class_("p-window-resizer color-container-lighter border-left border-top"),
                onmousedown(selectWindow.bind(window, true))
            ], [])
        ]);
    }

    public static function lineItem(toggleLineItem :LineItem -> MouseEvent -> GenMsg, lineItem :LineItem, line :RenderFunction<Model, GenMsg>, children :Array<RenderFunction<Model, GenMsg>>) : RenderFunction<Model, GenMsg> 
    {
        // return div([], []);
        return div([class_("p-line-item color-container-darkest")], [
			div([class_("color-container-lighter p-line-item-heading")], [
				span([class_("p-line-item-toggle"), onclick(toggleLineItem.bind(lineItem))], [text((lineItem.isExpanded ? "▼" : "►"))]),
				line
			]),
			lineItem.isExpanded ? div([class_("p-line-item-children")], children) : span([], [text("")])
		]);
    }
}