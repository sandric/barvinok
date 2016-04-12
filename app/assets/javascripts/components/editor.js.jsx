class Editor extends React.Component {

	constructor (props) {
		super(props)

		this.state = {
    		display: 'visual'
    	}

    	if (props.editable)
    		this.state.changes = props.data


    	window.getEditorChanges = () => {
    		this.saveChanges()
    		return this.state.changes 
    	}
	}

	getChanges () {
		this.saveChanges()
		return this.state.changes
	}

	saveChanges () {

		if (this.state.display == 'visual') {
			if (this.props.editable) {
				this.setState({changes: this.refs.VisualEditor.getValue()})
			}
		} else {
			if (this.props.editable) {
				this.setState({changes: this.refs.TextualEditor.getValue()})
			}
		}
	}

	toggleDisplay (event) {

		this.saveChanges()

		if (this.state.display == 'visual')
			this.setState({display: 'textual'})
		else
			this.setState({display: 'visual'})

		event.stopPropagation()
	}

	render () {

		return (

			<div class="editor">

				<button type="button" onClick={this.toggleDisplay.bind(this)}> 
					{this.state.display == 'visual' ? 'textual' : 'visual'} 
				</button>

				{this.state.display == 'visual' ? 
					this.props.editable ?
						<VisualEditor
							ref="VisualEditor"
							data={this.state.changes}
							editable={this.props.editable}
						/> : 
						<VisualEditor
							ref="VisualEditor"
							data={this.props.data}
							editable={this.props.editable}
						/> :
					this.props.editable ?
						<TextualEditor
							ref="TextualEditor"
							data={this.props.data}
							changes={this.state.changes}
							editable={this.props.editable}
						/> :
						<TextualEditor
							ref="TextualEditor"
							data={this.props.data}
							editable={this.props.editable}
						/>
				}
			</div>
		)
	}
}