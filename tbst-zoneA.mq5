int start()
{
// Set the chart to display the H1 timeframe
ChartSetSymbolPeriod(0, PERIOD_H1);

// Get the time of the second candle bar for the day
datetime secondCandleTime = TimeCurrent() - PERIOD_H1;

// Get the open, high, low, and close prices for the second candle bar
double openPrice = iOpen(0, secondCandleTime);
double highPrice = iHigh(0, secondCandleTime);
double lowPrice = iLow(0, secondCandleTime);
double closePrice = iClose(0, secondCandleTime);

// Draw the square around the second candle bar
int squareId = ObjectCreate("Second Candle Square", OBJ_RECTANGLE, 0, secondCandleTime, openPrice, secondCandleTime + PERIOD_H1, closePrice);

// Customize the appearance of the square
ObjectSet(0, squareId, OBJPROP_COLOR, clrGreen);
ObjectSet(0, squareId, OBJPROP_STYLE, STYLE_SOLID);
ObjectSet(0, squareId, OBJPROP_WIDTH, 2);

return(0);
}




