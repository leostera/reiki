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

  /**
    Attributes used to create a brand new node.
    */
  type attrs = {
    /** The width of the node */
    width: int,
    /** The height of the node */
    height: int,
    /** Whether the contents should be justified */
    justify_content,
    /** The flex direction for the children of this node */
    flex_direction,
    /** How to align children of this node */
    align_items: alignment,
  };

  /**
    Abstract node type. Kept abstract to prevent access to internal library
    shenanigans.
   */
  type t;

  /**
    [create attrs]

    Core function used to create a new node.
    */
  let create: attrs => t;

  /**
    [insertChild child index node]

    Insert a child. This will mutate the current Node by adding a child by index
    to it's internal array of children.
    */
  let insertChild: (t, int, t) => t;
  let calculateLayout: (ctx, t) => t;
  let computedLayout: t => computed_layout;
};

module Operators: {
  /**
      [ root <<- (child, index) ]

      Insert child into the left-hand-side node.
    */
  let (<<-): (Node.t, (Node.t, int)) => Node.t;

  /**
      [ root *> context == computed_layout ]

      Recompute a layout on a given context.
    */
  let ( *> ): (Node.t, Node.ctx) => Node.computed_layout;
};
