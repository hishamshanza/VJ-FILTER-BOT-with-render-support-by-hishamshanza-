FROM python:3.10-slim

# System update & install dependencies
RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y git && \
    rm -rf /var/lib/apt/lists/*

# Copy requirements & install Python deps
COPY requirements.txt /requirements.txt
RUN pip install --no-cache-dir -r /requirements.txt

# Copy app code
WORKDIR /app
COPY . /app

# Expose port (Telegram bots usually use webhooks on 8080)
EXPOSE 8080

# Run the bot (replace 'bot.py' with your main file)
CMD ["python", "bot.py"]
