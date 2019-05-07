package perdita;

import towser.Html.*;
import towser.Html;
import towser.Attribute;
import towser.RenderFunction;
import perdita.model.Textfield;
import perdita.model.AccordianItem;
import perdita.model.Drawer;
import perdita.model.LineItem;
import perdita.model.Toggle;
import perdita.model.Window;
import js.html.MouseEvent;

class Perdita
{
    public static function textfield<Model, Msg>(msg :Textfield -> String -> Msg, field :Textfield) :RenderFunction<Model, Msg>
    {
        var filledClass = field.value == "" ? "" : " filled";
        return div([CLASS("p-textfield" + filledClass)], [
            input([ON_INPUT(msg.bind(field)), VALUE(new String(field.value))]),
            span([], field.label)
        ]);
    }

    public static function accordianItem<Model, Msg>(toggleWindow :AccordianItem -> Msg, window :AccordianItem, children :Array<RenderFunction<Model, Msg>>) : RenderFunction<Model, Msg> 
    {
        var heightClass = window.isOpen ? " open" : "";
        var arrow = window.isOpen ? "▼ " : "▶ ";

        var content = window.isOpen ? 
            [
                h1([CLASS("p-accordianItem-title"), ON_CLICK(toggleWindow(window))], arrow + window.title),
                div([], children)
            ] : [h1([CLASS("p-accordianItem-title"), ON_CLICK(toggleWindow(window))], arrow + window.title)];

        return div([CLASS("p-accordianItem color-container-lighter border-bottom" + heightClass)], content);
    }

    public static function drawer<Model, Msg>(stretch :Drawer -> MouseEvent -> Msg, toggle :Drawer -> Msg, drawer :Drawer, children :Array<RenderFunction<Model, Msg>>) : RenderFunction<Model, Msg> 
    {
        var openClass = drawer.isOpen ? " open" : " closed";
        var content = drawer.isOpen 
            ? div([CLASS("flex-column p-drawer-content color-container border-left border-right")], children)
            : div([], []);
        var leftClass = drawer.isLeft ? " left" : "";
        var activeClass = drawer.isActive ? " active" : "";

        var innerConent = [
            h1([CLASS("p-drawer-collapser toggler color-actionable" + activeClass), MOUSE_DOWN(stretch.bind(drawer)), ON_DBL_CLICK(toggle(drawer))], "⋮"),
            content,
            div([CLASS("p-drawer-collapser barrier")], [])
        ];
        if(drawer.isLeft) {
            innerConent.reverse();
        }

        return div([
            CLASS("p-drawer color-container flex-row border-right border-left" + openClass + leftClass), 
            STYLE({width: drawer.width + "px"})
        ], innerConent);
    }

    public static function toggle<Model, Msg>(toggleButton :Toggle -> Msg, button :Toggle) : RenderFunction<Model, Msg> 
    {
        var attrs = [TYPE("checkbox")];
        if(button.isActive) {
            attrs.push(ATTR("checked", true));
        }
        return label([CLASS("p-switch")], [
            input(attrs),
            span([],"")
        ]);
    }

    public static function window<Model, Msg>(selectWindow :Window -> Bool -> MouseEvent -> Msg, window :Window, children :Array<RenderFunction<Model, Msg>>) : RenderFunction<Model, Msg> 
    {
        return div([
            CLASS("p-window color-container"), 
            MOUSE_DOWN(selectWindow.bind(window, false)),
            STYLE({
                left: window.position.x + "px", 
                top: window.position.y + "px",
                width: window.dimensions.x + "px",
                height: window.dimensions.y + "px"
            })
        ], [
            div([CLASS("p-window-bar color-container-darker border-bottom")], []),
            div([CLASS("flex-column")], children),
            div([
                CLASS("p-window-resizer color-container-lighter border-left border-top"),
                MOUSE_DOWN(selectWindow.bind(window, true))
            ], [])
        ]);
    }

    public static function lineItem<Model, Msg>(toggleLineItem :LineItem -> Msg, lineItem :LineItem, children :Array<RenderFunction<Model, Msg>>) : RenderFunction<Model, Msg> 
    {
        return div([CLASS("p-line-item color-container-darkest")], [
			div([CLASS("color-container-lighter"), ON_CLICK(toggleLineItem(lineItem))], [
				span([CLASS("p-line-item-toggle")], (lineItem.isExpanded ? "-" : "+")),
				span([CLASS("p-line-item-title")], lineItem.title)
			]),
			lineItem.isExpanded ? div([CLASS("p-line-item-children")], children) : span([], "")
		]);
    }
}