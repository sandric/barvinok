class Editor extends React.Component {

	constructor () {
		super()
	}

	componentDidMount () {
   
		this.editor = CodeMirror(editorElement, {
	        value: JSON.stringify(JSON.parse(this.props.originalData), null, 2),
	        lineNumbers: true,
	        mode: "application/ld+json",
	        readOnly: !this.props.editable
	    });
	}

	render () {

		return (

			<div id="editor"></div>
		)
	}
}