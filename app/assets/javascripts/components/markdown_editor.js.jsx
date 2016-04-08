class MarkdownEditor extends React.Component {

	constructor (props) {
		super(props)

		this.state = {
			mode: 'editing',
			data: this.props.data
		}
	}

	componentDidMount () {

		this.editor = CodeMirror.fromTextArea(document.getElementById(`${this.props.model}_${this.props.field}`), {
  			value: this.state.data,
  			mode:  "markdown",
  			lineNumbers: true,
  		});

		this.editor.on('change', () => {
			this.editor.save()

    		this.state.data = document.getElementById(`${this.props.model}_${this.props.field}`).value;
    		this.setState(this.state)
		});
	}

	toggleMode (event) {
		if (this.state.mode == 'editing') {
			this.state.mode = 'previewing'
			this.editor.getWrapperElement().style.display = 'none';
		} else {
			this.state.mode = 'editing'
			this.editor.getWrapperElement().style.display = 'block';
		}

		this.setState(this.state)

		event.stopPropagation();
	}


	render () {

		return (

			<div className="markdown_editor">

				<button type="button" onClick={this.toggleMode.bind(this)}> 
					{this.state.mode == 'editing' ? 'preview' : 'edit'} 
				</button>

				<textarea 
					name={this.props.model + '[' + this.props.field + ']'}
					id={this.props.model + '_' + this.props.field} 
					style={{display: 'none'}} 
					value={this.state.data} 
					readOnly>
				</textarea>

				<Markdown 
					hidden={this.state.mode == 'editing'}
					data={this.state.data}
				/>
			</div>
		)
	}
}