from flask import Flask, render_template
from models import storage
from models.state import State

app = Flask(__name__)


@app.teardown_appcontext
def teardown_db(exception):
    """Close the SQLAlchemy Session after each request."""
    storage.close()


@app.route('/cities_by_states', strict_slashes=False)
def states_cities():
    """Display a HTML page with a list of states and their cities."""
    states = storage.all(State).values()
    states_sorted = sorted(states, key=lambda s: s.name)

    return render_template('8-cities_by_states.html', states=states_sorted)


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
