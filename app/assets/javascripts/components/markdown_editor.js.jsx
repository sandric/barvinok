class MarkdownEditor extends React.Component {

	constructor (props) {
		super(props)

		this.state = {
			mode: this.props.mode || 'preview',
			changes: this.props.data || ""
		}

		window.getMarkdownEditorChanges = () => {
    		return this.getChanges()
    	}
	}

	componentDidMount () {
		if (this.props.editable)
			this.initializeCodeMirror()	      
	}

	getChanges () {
		return this.state.changes
	}

	initializeCodeMirror () {

  		this.editor = CodeMirror(this.refs.MarkdownEditor, {
	        value: this.state.changes,
	        mode: "markdown",
	        lineNumbers: true
		});

		this.editor.on('change', () => {
    		this.setState({changes: this.editor.getValue()})
		});
	}

	toggleMode (event) {

		if (this.state.mode == 'edit') {
			this.setState({mode: 'preview'})
		} else {
			this.setState({mode: 'edit'})
		}

		event.stopPropagation();
	}

	generateMarkup () { 
		return {__html: marked(this.state.changes)} 
	}


	render () {

		return (

			<div className="markdown-editor">

				{this.props.editable ?

					<button type="button" onClick={this.toggleMode.bind(this)}> 
						{this.state.mode == 'edit' ? 'preview' : 'edit'} 
					</button> : null}

					<div className={this.state.mode == 'preview' ? 'hidden' : ''} ref="MarkdownEditor"></div> 

					<div className={this.state.mode == 'preview' ? 'markdown' : 'hidden'}
						dangerouslySetInnerHTML={this.generateMarkup()}>
					</div>
			</div>
		)
	}
}