class Editor extends React.Component {

	constructor () {
		super()
	
		this.state = {
    		display: 'visual'
    	}
	}

	componentDidMount () {
    
	}

	toggleDisplay (event) {

		if (this.state.display == 'visual') {
			this.state.display = 'textual'
		} else {
			this.state.display = 'visual'
		}

		this.setState(this.state)

		event.stopPropagation();
	}

	render () {

		return (

			<div class="editor">

				<button type="button" onClick={this.toggleDisplay.bind(this)}> 
					{this.state.display == 'visual' ? 'textual' : 'visual'} 
				</button>

				{this.state.display == 'visual' ? 
					<VisualEditor
						data={this.props.data}
						editable={this.props.editable}
					/> : 
					<TextualEditor
						data={this.props.data}
						editable={this.props.editable}
					/>
				}
			</div>
		)
	}
}