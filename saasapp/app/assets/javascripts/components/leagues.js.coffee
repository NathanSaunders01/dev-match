@Leagues - React.createClass
  getInitialState: ->
    leagues: @props.data
  getDefaultProps: ->
    leagues: []
  render: ->
    React.DOM.div
      className: 'leagues'
      React.DOM.h1
        className: 'title'
        'Leagues'