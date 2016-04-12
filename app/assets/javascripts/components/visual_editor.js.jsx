class VisualEditor extends React.Component {

	constructor () {
		super()
	}

   getValue () {
    	return visual_editor.db.serialize_keyboard()
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