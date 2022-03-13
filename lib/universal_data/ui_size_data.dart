double mappBarHeight = 0.0;
double mbottomBarHeight = 0.0;
double mwidth = 0.0;
double mheight = 0.0;
double mpaddingTop = 0.0;
double mpaddingBottom = 0.0;
double mpaddingLeft = 0.0;
double mpaddingRight = 0.0;
double mpadding = 0.0;
double mworkableWidth = 0.0;
double mworkableHeight = 0.0;

class CanvasWorkableSize {
  double get workableWidth => mworkableWidth;
  double get bottomBarHeight => mbottomBarHeight;
  double get width => mwidth;
  double get height => mheight;
  double get paddingTop => mpaddingTop;
  double get paddingBottom => mpaddingBottom;
  double get paddingLeft => mpaddingLeft;
  double get paddingRight => mpaddingRight;
  double get padding => mpadding;
  double get workableHeight => mworkableHeight;

  CanvasWorkableSize(
      {mappBarHeight = 0.0,
      mbottomBarHeight = 0.0,
      mwidth = 0.0,
      mheight = 0.0,
      mpaddingTop = 0.0,
      mpaddingBottom = 0.0,
      mpaddingLeft = 0.0,
      mpaddingRight = 0.0,
      mpadding = 0.0,
      mworkableWidth = 0.0,
      mworkableHeight = 0.0});
}
