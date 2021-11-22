from flask import Flask, render_template
import random

app = Flask(__name__)

images = [
    "https://imgs.xkcd.com/comics/containers_2x.png",
    "https://imgs.xkcd.com/comics/geohashing.png",
    "https://imgs.xkcd.com/comics/privacy_opinions_2x.png",
    "https://imgs.xkcd.com/comics/rosetta_2x.png",
    "https://imgs.xkcd.com/comics/meteorite_identification_2x.png",
    "https://imgs.xkcd.com/comics/five_day_forecast_2x.png"
]

@app.route('/')
def index():
    url = random.choice(images)
    return render_template('index.html', url=url)

if __name__ == "__main__":
    app.run(host="0.0.0.0")
