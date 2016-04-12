class Talk extends React.Component {

	constructor (props) {
		super(props)

		this.state = {
			changes: props.talk.data,
			title: props.talk.title
		}
	}

	onChangeTitle (event) {
		this.setState({title: event.target.value})
	}

	submit () {
		this.setState({changes: this.refs.MarkdownEditor.getChanges()})
	}

	render () {

		if (this.props.action == 'new') {
			var submitAction = 'Create talk'
			var formAction = `/${this.props.user.name}/${this.props.keyboard.name}/talks/`
			var method = 'post'
			var mode = 'edit'
		}
		else if (this.props.action == 'edit') {
			var submitAction = 'Update talk'
			var formAction = `/${this.props.user.name}/${this.props.keyboard.name}/talks/${this.props.talk.id}/`
			var method = 'patch'
			var mode = 'edit'
		}

		return (

			<div className="talk">

				<form 
					action={formAction}
					accept-charset="UTF-8" 
					method="post">

					<input name="utf8" type="hidden" value="✓"/>

					<input type="hidden" name="_method" value={method}/>

					<input type="hidden" name="authenticity_token" value={this.props.authenticity_token}/>

					<input type="text" value={this.state.title} name="talk[title]" onChange={this.onChangeTitle.bind(this)}/>

					<input type="hidden" value={this.state.changes} name="talk[data]"/>

					<input type="submit" name="commit" value={submitAction} onClick={this.submit.bind(this)}/>
				</form>

				<MarkdownEditor
					ref="MarkdownEditor"
					data={this.props.talk.data} 
					editable={true} 
					mode={mode}
				/>

			</div>
		)
	}
}