package perdita;

import towser.Html.*;
import towser.Html;
import towser.Attribute;
import towser.RenderFunction;
import perdita.model.Textfield;
import perdita.model.AccordianItem;
import perdita.model.Drawer;
import perdita.model.Toggle;
import perdita.model.Window;
import js.html.MouseEvent;

class Perdita
{
    public static function textfield<Model, Msg>(msg :Textfield -> String -> Msg, field :Textfield) :RenderFunction<Model, Msg>
    {
        var filledClass = field.value == "" ? "" : " filled";
        return div([CLASS("m-textfield-outlined" + filledClass)], [
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
                h1([CLASS("collapse-title"), ON_CLICK(toggleWindow(window))], arrow + window.title),
                div([], children)
            ] : [h1([CLASS("collapse-title"), ON_CLICK(toggleWindow(window))], arrow + window.title)];

        return div([CLASS("collapse color-container-lighter border-bottom" + heightClass)], content);
    }

    public static function drawer<Model, Msg>(stretch :Drawer -> MouseEvent -> Msg, toggle :Drawer -> Msg, drawer :Drawer, children :Array<RenderFunction<Model, Msg>>) : RenderFunction<Model, Msg> 
    {
        var openClass = drawer.isOpen ? " open" : " closed";
        var content = drawer.isOpen 
            ? div([CLASS("flex-column drawer-content color-container border-left border-right")], children)
            : div([], []);
        var leftClass = drawer.isLeft ? " left" : "";
        var activeClass = drawer.isActive ? " active" : "";

        var innerConent = [
            h1([CLASS("drawer-collapser toggler color-actionable" + activeClass), MOUSE_DOWN(stretch.bind(drawer)), ON_DBL_CLICK(toggle(drawer))], "⋮"),
            content,
            div([CLASS("drawer-collapser barrier")], [])
        ];
        if(drawer.isLeft) {
            innerConent.reverse();
        }

        return div([
            CLASS("drawer color-container flex-row border-right border-left" + openClass + leftClass), 
            STYLE({width: drawer.width + "px"})
        ], innerConent);
    }

    public static function toggle<Model, Msg>(toggleButton :Toggle -> Msg, button :Toggle) : RenderFunction<Model, Msg> 
    {
        var attrs = [TYPE("checkbox")];
        if(button.isActive) {
            attrs.push(ATTR("checked", true));
        }
        return label([CLASS("switch")], [
            input(attrs),
            span([],"")
        ]);
    }

    public static function window<Model, Msg>(selectWindow :Window -> Bool -> MouseEvent -> Msg, window :Window, children :Array<RenderFunction<Model, Msg>>) : RenderFunction<Model, Msg> 
    {
        return div([
            CLASS("hover-window color-container"), 
            MOUSE_DOWN(selectWindow.bind(window, false)),
            STYLE({
                left: window.position.x + "px", 
                top: window.position.y + "px",
                width: window.dimensions.x + "px",
                height: window.dimensions.y + "px"
            })
        ], [
            div([CLASS("hover-window-bar color-container-darker border-bottom")], []),
            div([CLASS("flex-column")], children),
            div([
                CLASS("hover-window-resizer color-container-lighter border-left border-top"),
                MOUSE_DOWN(selectWindow.bind(window, true))
            ], [])
        ]);
    }
}