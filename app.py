from flask import Flask, jsonify  
import random  

app = Flask(__name__)  

quotes = [  
    "Believe you can and you're halfway there.  Theodore Roosevelt",  
    "You are never too old to set another goal or to dream a new dream.  C.S. Lewis",  
    "The only way to do great work is to love what you do.  Steve Jobs",  
    "Success is not final, failure is not fatal. It is the courage to continue that counts.  Winston Churchill",  
    "What lies behind us and what lies before us are tiny matters compared to what lies within us.  Ralph Waldo Emerson"  
]  

@app.route('/quote')  
def get_quote():  
    quote = random.choice(quotes)  
    return jsonify(quote=quote)  

if __name__ == '__main__':  
    app.run(debug=True)