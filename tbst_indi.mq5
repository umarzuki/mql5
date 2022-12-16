#include <Trade/Trade.mqh>
#include <Trade/SymbolInfo.mqh>

#define MA_PERIOD 5
#define K_FACTOR 3
#define D_FACTOR 3

double tbst_up_line[];
double tbst_down_line[];

void OnInit()
{
// Set up the tbst indicator arrays
ArrayResize(tbst_up_line, 0);
ArrayResize(tbst_down_line, 0);
}

void OnTick()
{
// Calculate the tbst indicator values
double k = K_FACTOR * (iMA(NULL, 0, MA_PERIOD, 0, MODE_EMA, PRICE_TYPICAL, 0) - iMA(NULL, 0, MA_PERIOD, 0, MODE_EMA, PRICE_TYPICAL, 1)) / SymbolInfoDouble(Symbol(), SYMBOL_POINT);
double d = D_FACTOR * iMA(NULL, 0, MA_PERIOD, 0, MODE_EMA, k, 0);
double tbst_up = k + d;
double tbst_down = k - d;

// Add the tbst values to the arrays
ArrayPush(tbst_up_line, tbst_up);
ArrayPush(tbst_down_line, tbst_down);
}