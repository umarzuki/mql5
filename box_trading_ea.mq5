// Box Trading Strategy EA

// Inputs
int boxSize = 100; // size of the box in pips
double takeProfit = 50; // take profit level in pips
double stopLoss = 50; // stop loss level in pips

// Variables
double highPrice, lowPrice; // high and low prices of the current box
int orderType; // long or short
double openPrice; // opening price of the trade
double closePrice; // closing price of the trade
double profit; // profit or loss of the trade

// Initialization
void OnInit()
{
// Set high and low prices of the current box
highPrice = High[0];
lowPrice = Low[0];
}

// Trade execution
void OnTick()
{
// Check if the high or low price of the current box has been breached
if (High[0] > highPrice || Low[0] < lowPrice)
{
// Close the current trade
if (PositionSelect() == 0)
{
// No trade is open, do nothing
return;
}
else
{
// Trade is open, close it
closePrice = Bid;
profit = OrderProfit();
OrderClose(OrderTicket(), OrderLots(), Bid, 3, Blue);
}


  // Calculate the new high and low prices for the next box
  if (High[0] > highPrice)
  {
     highPrice = High[0];
  }
  if (Low[0] < lowPrice)
  {
     lowPrice = Low[0];
  }

  // Determine the order type (long or short)
  if (closePrice < lowPrice)
  {
     orderType = OP_BUY;
     openPrice = lowPrice + boxSize * Point;
  }
  else if (closePrice > highPrice)
  {
     orderType = OP_SELL;
     openPrice = highPrice - boxSize * Point;
  }

  // Open the trade
  OrderSend(Symbol(), orderType, 1, openPrice, 3, 0, 0, "Box Trade", MagicNumber, 0, Green);
}
}

// Stop loss and take profit
void OnStopLoss(const int ticket)
{
if (OrderType() == OP_BUY)
{
OrderModify(ticket, OrderOpenPrice(), OrderOpenPrice() - stopLoss * Point, OrderTakeProfit(), 0, White);
}
else if (OrderType() == OP_SELL)
{
OrderModify(ticket, OrderOpenPrice(), OrderOpenPrice() + stopLoss * Point, OrderTakeProfit(), 0, White);
}
}

void OnTakeProfit(const int ticket)
{
if (OrderType() == OP_BUY)
{
OrderModify(ticket, OrderOpenPrice(), OrderStopLoss(), OrderOpenPrice() + takeProfit * Point, 0, White);
}
else if (OrderType() == OP_SELL)
{
OrderModify(ticket, OrderOpenPrice(), OrderStopLoss(), OrderOpenPrice() - takeProfit * Point, 0, White);
}
}