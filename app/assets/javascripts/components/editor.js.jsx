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

	addLayer (layer) {

		parsed_changes = JSON.parse(this.state.changes)
		parsed_changes.layers.push(layer)

		this.setState({changes: JSON.stringify(parsed_changes)})		
	}

	toggleDisplay (event) {

		this.saveChanges()

		if (this.state.display == 'visual')
			this.setState({display: 'textual'})
		else
			this.setState({display: 'visual'})

		event.stopPropagation()
	}

	getAutosuggestionOptions (input, callback) {

		if (!input)
			return callback(null, { 
				options: [
			    	{ value: '/base/empty', label: '/base/empty' },
			    	{ value: '/base/qwerty', label: '/base/qwerty' },
			    	{ value: '/base/dvorak', label: '/base/dvorak' },
			    	{ value: '/base/colemak', label: '/base/colemak' },
				]
			});
		else
		  	return fetch(`/layers.json?q=${input}`)
		    	.then((response) => {
		      		return response.json()
		    	}).then((json) => {
		    		return { 
		    			options: json.map(function(path) {
							return { value: path, label: path }
						})
		    		}
		    	});
	}

	onAutosuggestionChange (value) {
		fetch(value.value)
	    	.then((response) => {
	      		return response.json()
	    	}).then((json) => {
	    		this.addLayer(json)
	    	});
	}


	render () {

		return (

			<div class="editor">

				{this.props.editable ?
					<Select.Async
					    name="form-field-name"
					    loadOptions={this.getAutosuggestionOptions}
					    onChange={this.onAutosuggestionChange.bind(this)}
					/>:null}

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