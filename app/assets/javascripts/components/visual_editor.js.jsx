class VisualEditor extends React.Component {

	constructor () {
		super()
	}

	componentDidMount () {

		visual_editor.core.initialize(this.props.data, this.props.editable)
	}

	render () {

		return (

			<div id="visual-editor"></div>
		)
	}
}