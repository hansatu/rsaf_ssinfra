FROM python:3.9-slim

WORKDIR /app

# COPY all the depency files and run for installation
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# COPY application code into the container
COPY . .

# EXPOSE the port that the app will run on
EXPOSE 3333

CMD ["python", "app.py"]