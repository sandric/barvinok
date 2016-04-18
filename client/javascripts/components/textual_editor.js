import React from 'react';


import CodeMirror from 'codemirror/lib/codemirror';

import 'codemirror/addon/merge/merge.js';

import 'codemirror/addon/merge/merge.css';

import 'codemirror/mode/javascript/javascript.js';

import 'codemirror/mode/markdown/markdown.js';


export default class TextualEditor extends React.Component {

	constructor () {
		super()
	}

	diffEditorHeight () {
        return Math.max(this.editor.editor().getScrollInfo().height,
                        this.editor.rightOriginal().getScrollInfo().height)
	}

    resizeDiffEditor () {

        var height = this.diffEditorHeight()

        while (true) {

          if (this.editor.leftOriginal())
            this.editor.leftOriginal().setSize(null, height)

          this.editor.editor().setSize(null, height)

          if (this.editor.rightOriginal())
            this.editor.rightOriginal().setSize(null, height)

          var newHeight = this.diffEditorHeight()

          if (newHeight >= height) break

          else height = newHeight
        }

        this.editor.wrap.style.height = height + "px";
    }

    getValue () {
    	if (this.props.changes)
    		return this.editor.editor().getValue()
    	else
    		return this.editor.getValue()
    }

    initializeCodeMirror () {

    	if (this.props.changes) {

			this.editor = CodeMirror.MergeView(document.getElementById("textual-editor"), {
				orig: JSON.stringify(JSON.parse(this.props.data), null, 2),
				value: JSON.stringify(JSON.parse(this.props.changes), null, 2),
				lineNumbers: true,
				mode: "application/ld+json",
				highlightDifferences: true,
				readOnly: !this.props.editable,
				revertButtons: false
			});

	        this.resizeDiffEditor(this.editor)

	    } else {

			this.editor = CodeMirror(document.getElementById('textual-editor'), {
		        value: JSON.stringify(JSON.parse(this.props.data), null, 2),
		        lineNumbers: true,
		        mode: "application/ld+json",
		        readOnly: !this.props.editable
		    });
		}
    }

	componentDidMount () {
		this.initializeCodeMirror()
	}

	componentDidUpdate () {
		this.initializeCodeMirror()
	}

	render () {
		return <div id="textual-editor"></div>
	}
}