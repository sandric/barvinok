//import User from './components/user'

//import Keyboard from './components/keyboard'

//import Talk from './components/talk'

//import MarkdownEditor from './components/comment'


//import Editor from './components/editor'


//require("expose?React!react")

//require('expose?Talk!./components/talk').default

//require('expose?Comment!./components/comment').default


import React from 'react';
import ReactDOM from 'react-dom';


window.renderReact = function(componentName, id, props) {

  var componentUnderscoreName = componentName.replace(/([A-Z])/g, function($1) { return "_" + $1.toLowerCase(); }).slice(1);

  var component = require(`./components/${componentUnderscoreName}`);
  ReactDOM.render(React.createElement(component, props), document.getElementById(id));
}



//import './refile'