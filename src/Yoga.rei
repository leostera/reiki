type justify_content =
  | Flex_start
  | Center
  | Flex_end
  | Space_between
  | Space_around
  | Space_evenly;

type alignment =
  | Auto
  | Flex_start
  | Center
  | Flex_end
  | Stretch
  | Baseline
  | Space_between
  | Space_around;

type flex_direction =
  | Column
  | Column_reverse
  | Row
  | Row_reverse;

type direction =
  | Inherit
  | Left_to_right
  | Right_to_left;

type flex_wrap =
  | No_wrap
  | Wrap
  | Wrap_reverse;

type edge =
  | Left
  | Top
  | Right
  | Bottom
  | Start
  | End
  | Horizontal
  | Vertical
  | All;

type display =
  | Flex
  | None;

type layout_unit =
  | Auto
  | Percent
  | Point
  | Undefined;

type overflow =
  | Hidden
  | Scroll
  | Visible;

type position_type =
  | Absolute
  | Relative;

/**
  A Yoga layout node.

  This is the {e base} of the package, as it's the unit of composition of
  layouts.
  */
module Node: {
  type ctx = {
    width: int,
    height: int,
    direction,
  };

  type computed_layout = {
    left: int,
    top: int,
    width: int,
    height: int,
  };

  type attrs = {
    width: int,
    height: int,
    justify_content,
    flex_direction,
    align_items: alignment,
  };

  /**
    Abstract node type. Kept abstract to prevent access to internal library
    shenanigans.
   */
  type t;

  let create: attrs => t;
  let insertChild: (t, int, t) => t;
  let calculateLayout: (ctx, t) => t;
  let computedLayout: t => computed_layout;
};
