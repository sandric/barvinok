class TextualEditor extends React.Component {

	constructor () {
		super()
	}

	componentDidMount () {
   
		this.editor = CodeMirror(document.getElementById('textual-editor'), {
	        value: JSON.stringify(JSON.parse(this.props.data), null, 2),
	        lineNumbers: true,
	        mode: "application/ld+json",
	        readOnly: !this.props.editable
	    });
	}

	render () {

		return (

			<div id="textual-editor"></div>
		)
	}
}