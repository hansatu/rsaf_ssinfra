from flask import Flask
import redis

app = Flask(__name__)

# Connect to the Redis server
r = redis.Redis(host='redis', port=6379, db=0, decode_responses=True)

@app.route('/')
def home():
    # Get the current count from Redis, increment it, and display it
    visitor_count = r.incr('visitor_count')
    return f'You are the {visitor_count}th visitor!'

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=3333)
