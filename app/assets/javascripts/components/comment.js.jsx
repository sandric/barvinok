class Comment extends React.Component {

	constructor (props) {
		super(props)

		this.state = {
			changes: props.comment.data
		}
	}

	submit () {
		this.setState({changes: this.refs.MarkdownEditor.getChanges()})
	}

	render () {

		if (this.props.action == 'new') {
			var submitAction = 'Create comment'
			var formAction = `/${this.props.user.name}/${this.props.keyboard.name}/talks/${this.props.talk.id}/comments/`
			var method = 'post'
			var mode = 'edit'
		}
		else if (this.props.action == 'edit') {
			var submitAction = 'Update comment'
			var formAction = `/${this.props.user.name}/${this.props.keyboard.name}/talks/${this.props.talk.id}/comments/${this.props.comment.id}`		
			var method = 'patch'
			var mode = 'preview'
		}

		return (

			<div className="comment">

				<form 
					action={formAction}
					accept-charset="UTF-8" 
					method="post">

					<input name="utf8" type="hidden" value="✓"/>

					<input type="hidden" name="_method" value={method}/>

					<input type="hidden" name="authenticity_token" value={this.props.authenticity_token}/>

					<input type="hidden" value={this.state.changes} name="comment[data]" id="comment_data"/>

					<input type="submit" name="commit" value={submitAction} onClick={this.submit.bind(this)}/>
				</form>

				<MarkdownEditor
					ref="MarkdownEditor"
					data={this.props.comment.data} 
					editable={true} 
					mode={mode}
				/>

			</div>
		)
	}
}