#include <Indicators\SmartMoney.mqh>
#include <Trade\Trade.mqh>

input int SmartMoneyPeriod = 10; // period of smart money indicator
input int OrderSize = 1; // size of orders to be placed
input int MaxTrades = 5; // maximum number of trades to be placed

SmartMoney smartMoney; // create instance of smart money indicator
int tradesPlaced = 0; // counter for number of trades placed

// initialize smart money indicator
void OnInit()
{
smartMoney.period = SmartMoneyPeriod;
}

// check for trade signals
void OnTick()
{
// check if smart money indicator is above threshold
if (smartMoney.GetValue() > 0.5 && tradesPlaced < MaxTrades)
{
// place buy order
OrderSend(Symbol(), OP_BUY, OrderSize, Ask, 3, 0, 0, "Smart Money Trade", 0, 0, Green);
tradesPlaced++;
}
// check if smart money indicator is below threshold
else if (smartMoney.GetValue() < -0.5 && tradesPlaced < MaxTrades)
{
// place sell order
OrderSend(Symbol(), OP_SELL, OrderSize, Bid, 3, 0, 0, "Smart Money Trade", 0, 0, Red);
tradesPlaced++;
}
}
