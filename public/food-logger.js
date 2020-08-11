const React = window.React;
const ReactDOM = window.ReactDOM;

class FoodLoggerApp extends React.Component {
  constructor(props) {
    super(props);
    this.state = { foods: [] };
    console.log('loaded')
    $.ajax('/v0/foods').then((response, status, jqXHR) => {
        this.setState({ foods: response.foods })
    });
  }

  render() {
    return <div>Food logger app</div>
  }
}



var rootNode = document.getElementById('appRoot');
ReactDOM.render(<FoodLoggerApp/>, rootNode);
