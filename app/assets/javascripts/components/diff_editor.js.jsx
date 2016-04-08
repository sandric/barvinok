class DiffEditor extends React.Component {

	constructor () {
		super()
	}

	diffEditorHeight () {
        
		console.log(this.editor.leftOriginal())
		console.log(this.editor.editor())
		console.log(this.editor.rightOriginal())

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

	componentDidMount () {
    
        this.editor = CodeMirror.MergeView(document.getElementById("diff_editor"), {
			orig: JSON.stringify(JSON.parse(this.props.originalData), null, 2),
			value: JSON.stringify(JSON.parse(this.props.changedData), null, 2),
			lineNumbers: true,
			mode: "application/ld+json",
			highlightDifferences: true,
			readOnly: !this.props.editable,
			revertButtons: false
		});

        this.resizeDiffEditor(this.editor)
	}

	render () {

		return (

			<div id="diff_editor"></div>
		)
	}
}