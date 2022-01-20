#!/usr/bin/env python3

import email, smtplib, ssl
import logging
import socket

from email import encoders
from email.mime.base import MIMEBase
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText

from uptime import uptime

# configure logger
logging.basicConfig(filename='uptimeMonitor.log', level=logging.DEBUG)

# configure email properties
subject = 'Jenkins node {0} has been up for too long'.format(socket.gethostname())
body = 'click here to manually shut down the node in jenkins: {0}'.format('https://build.mmxlabs.com/computer/')
receivers = [
  'ppartarrieu@minimaxlabs.com'
  #'simon@minimaxlabs.com'
]
sender = 'ppartarrieu@minimaxlabs.com'
app_password = 'cfqpxjhusxesgofg'

def checkUptime():
  uptimeInSeconds = uptime()
  timeout = 2 * 3600 # 2 hours in seconds
  if (uptimeInSeconds > timeout):
    logging.error('node has been up for {0}min which is longer than the timeout {1}h'.format(int(uptimeInSeconds/60), timeout//3600))
    for receiver in receivers:
      sendEmail(subject, body, sender, receiver, app_password)

def sendEmail(subject, body, sender, receiver, password):

  logging.info('sending email...')

  # Create the email head (sender, receiver, and subject)
  email = MIMEMultipart()
  email["From"] = sender
  email["To"] = receiver
  email["Subject"] = subject

  # Add body and attachment to email
  email.attach(MIMEText(body, 'plain'))

  # Create SMTP session for sending the mail
  session = smtplib.SMTP('smtp.gmail.com', 587)
  session.starttls()
  session.login(sender, password)
  text = email.as_string()
  session.sendmail(sender, receiver, text)
  session.quit()

  # print out email
  logging.info(email['To'])
  logging.info(email['From'])
  logging.info(email['Subject'])
  logging.info(body)

checkUptime()
