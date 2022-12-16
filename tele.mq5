// Replace YOUR_CHAT_ID and YOUR_BOT_TOKEN with your actual chat id and bot token
string chatId = "YOUR_CHAT_ID";
string botToken = "YOUR_BOT_TOKEN";

// Set the message text
string messageText = "This is a test message from MQL5";

// Build the HTTP request URL
string requestUrl = "https://api.telegram.org/bot" + botToken + "/sendMessage?chat_id=" + chatId + "&text=" + messageText;

// Send the HTTP request
int result = SendFTP(requestUrl, "", "");

if (result == 0)
{
    // The message was sent successfully
    Print("Message sent successfully");
}
else
{
    // There was an error sending the message
    Print("Error sending message: ", result);
}
