#include <dt-bindings/zmk/pointing.h>

/*&mmv {*/
/*  acceleration-exponent = <1>;*/
/*  time-to-max-speed-ms = <40>;*/
/*  delay-ms = <0>;*/
/*};*/
/**/
/*&msc {*/
/*  acceleration-exponent = <0>;*/
/*  time-to-max-speed-ms = <40>;*/
/*  delay-ms = <10>;*/
/*};*/
/**/
/*#define U_MOUSE_MOVE_MAX 600*/
/*#define U_MOUSE_SCROLL_MAX 10*/
/**/
/*#undef MOVE_UP*/
/*#undef MOVE_DOWN*/
/*#undef MOVE_LEFT*/
/*#undef MOVE_RIGHT*/
/*#define MOVE_UP MOVE_VERT(-U_MOUSE_MOVE_MAX)*/
/*#define MOVE_DOWN MOVE_VERT(U_MOUSE_MOVE_MAX)*/
/*#define MOVE_LEFT MOVE_HOR(-U_MOUSE_MOVE_MAX)*/
/*#define MOVE_RIGHT MOVE_HOR(U_MOUSE_MOVE_MAX)*/
/**/
/*#undef SCROLL_UP*/
/*#undef SCROLL_DOWN*/
/*#undef SCROLL_LEFT*/
/*#undef SCROLL_RIGHT*/
/*#define SCROLL_UP SCROLL_VERT(U_MOUSE_SCROLL_MAX)*/
/*#define SCROLL_DOWN SCROLL_VERT(-U_MOUSE_SCROLL_MAX)*/
/*#define SCROLL_LEFT SCROLL_HOR(-U_MOUSE_SCROLL_MAX)*/
/*#define SCROLL_RIGHT SCROLL_HOR(U_MOUSE_SCROLL_MAX)*/

#define U_BTN1 &mkp LCLK
#define U_BTN2 &mkp RCLK
#define U_BTN3 &mkp MCLK
#define U_MS_U &mmv MOVE_UP
#define U_MS_D &mmv MOVE_DOWN
#define U_MS_L &mmv MOVE_LEFT
#define U_MS_R &mmv MOVE_RIGHT
#define U_WH_U &msc SCROLL_UP
#define U_WH_D &msc SCROLL_DOWN
#define U_WH_L &msc SCROLL_LEFT
#define U_WH_R &msc SCROLL_RIGHT

/* vim: set ft=cpp tw=174: */
