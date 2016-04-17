import './refile'

import React from 'react';
import ReactDOM from 'react-dom';


window.renderReact = function(componentName, id, props) {

  var componentUnderscoreName = componentName.replace(/([A-Z])/g, function($1) { return "_" + $1.toLowerCase(); }).slice(1);

  var component = require(`./components/${componentUnderscoreName}`);
  ReactDOM.render(React.createElement(component, props), document.getElementById(id));
}