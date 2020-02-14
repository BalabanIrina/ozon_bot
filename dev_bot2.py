#!/usr/bin/env python3

import json
import logging
import os

import pandas as pd
from io import BytesIO

# pip install python-telegram-bot
from telegram.ext import Updater
from telegram.ext import CommandHandler
from telegram.ext import MessageHandler, Filters

#
# Settings
#
tg_config = ".token_dev"

#
# TG Handlers
#

def start_callback(update, context):
    """
    Welcome response for the start command
    """
    chat_id = update.effective_chat.id
    logging.info(f"{chat_id} sent /start")
    start_message = f"Hello from Ozon Master bot!"
    context.bot.send_message(chat_id=chat_id, text=start_message)


def echo_callback(update, context):
    """
    Simply respond to any mesage with it's content
    """
   
    chat_id = update.effective_chat.id
    message_received = update.message.text
    logging.info(f"{chat_id} sent message: {message_received}")
    context.bot.send_message(chat_id=chat_id, text=update.message.text)


def document_download_callback(update, context):
    """
    Download the file sent to the bot
    """
    chat_id = update.effective_chat.id

    message = update.message
    logger.info(message)

    user = message.from_user
    document = message.document
   # file_id = document.file_id
    newFile = document.get_file()
    download_as = f'downloaded_{document.file_name}'
    newFile.download(download_as)
    user_log = f"{user.username}, {user.first_name}, {user.last_name}"
    document_log = f"{document.file_name} {document.file_size}"
    logging.info(f"{chat_id} ({user_log}) sent document: {document_log}")
    context.bot.send_message(chat_id=chat_id, text="Thanks!")


def document_callback(update, context):
    """
    This version reads the stream from TG directly into pandas
    """
    chat_id = update.effective_chat.id

    message = update.message
    logger.info(message)

    user = message.from_user
    document = message.document
    newFile = document.get_file()
    out = BytesIO()
    newFile.download(out=out)
    out.flush()
    df = pd.read_excel(out.getvalue())
    print(df)
    user_log = f"{user.username}, {user.first_name}, {user.last_name}"
    document_log = f"{document.file_name} {document.file_size}"
    logging.info(f"{chat_id} ({user_log}) sent document: {document_log}")
    context.bot.send_message(chat_id=chat_id, text="Thanks!")


#
# Main
#
logger = logging.getLogger("the_bot")
logger.setLevel(os.environ.get("DEBUG_LEVEL", "INFO"))

formatter = logging.Formatter('%(levelname)s:%(name)s:%(message)s')

console_handler = logging.StreamHandler()
console_handler.setFormatter(formatter)

logger.addHandler(console_handler)

#logging.basicConfig(format='%(asctime)s - %(name)s - %(levelname)s - %(message)s',
#                     level=logging.INFO)

#
# TG init
#

#get token from the config
with open(tg_config) as tg:
   tg_token = tg.read().strip()

assert tg_token != "", f"Could not get tg_token from {tg_config}"

updater = Updater(token=tg_token, use_context=True)

dispatcher = updater.dispatcher


#
# TG Handlers
#
start_handler = CommandHandler('start', start_callback)
dispatcher.add_handler(start_handler)

# Handler for any text message
echo_handler = MessageHandler(Filters.text, echo_callback)
dispatcher.add_handler(echo_handler)

# Handler for documents sent to the bot
file_handler = MessageHandler(Filters.document, document_callback)
dispatcher.add_handler(file_handler)


# Start_polling
updater.start_polling()


