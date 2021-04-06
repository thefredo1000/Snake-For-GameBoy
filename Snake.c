#include <gb/gb.h>

struct Tail {
    UINT8 x;
    UINT8 y;
    UBYTE active;
};
struct Snake {
    struct Tail tails[7];
	UINT8 x;
	UINT8 y;
    UINT8 width;
    UINT8 height;
};