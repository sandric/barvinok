import './refile'

import {diff_match_patch, DIFF_DELETE, DIFF_INSERT, DIFF_EQUAL} from "diff-match-patch";

window.diff_match_patch = diff_match_patch;
window.DIFF_DELETE = DIFF_DELETE;
window.DIFF_INSERT = DIFF_INSERT;
window.DIFF_EQUAL = DIFF_EQUAL;



import React from 'react';
import ReactDOM from 'react-dom';


window.renderReact = function(componentName, id, props) {

  var componentUnderscoreName = componentName.replace(/([A-Z])/g, function($1) { return "_" + $1.toLowerCase(); }).slice(1);

  var component = require(`./components/${componentUnderscoreName}`);
  ReactDOM.render(React.createElement(component, props), document.getElementById(id));
}