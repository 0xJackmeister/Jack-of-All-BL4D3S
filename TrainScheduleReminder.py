import telegram
import datetime

# Set up Telegram bot
bot = telegram.Bot('YOUR_API_TOKEN')
chat_id = 'YOUR_CHAT_ID'

# Define the train schedule
train_times = [
    '11:10',
    '12:20',
    '12:40',
    '13:00',
    '13:20',
    '14:30',
    '14:50',
    '15:10',
    '15:30',
    '16:40',
    '17:05',
    '17:25',
    '17:45',
    '18:50',
    '19:10',
    '19:30',
    '19:50',
    '21:00',
    '21:30',
    '21:55'
]

# Loop to check the current time against the train schedule
while True:
    current_time = datetime.datetime.now().strftime('%H:%M')
    if current_time in train_times:
        index = train_times.index(current_time)
        if 'PREPAID' not in f'M{index+1}':
            bot.send_message(chat_id, 'Times UP')
    time.sleep(60)  # Wait for 1 minute before checking again
