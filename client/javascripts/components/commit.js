import Editor from './editor'


export default class Commit extends React.Component {

	constructor (props) {
		super(props)

		this.state = {
			name: props.name || "",
			description: props.description || "",
			changes: ""
		}
	}

	onChangeName(event) {
		this.setState({name: event.target.value})
	}

	onChangeDescription(event) {
		this.setState({description: event.target.value})
	}

	submit (event) {
		this.setState({changes: this.refs.Editor.getChanges()})
	}

	render () {

		return <div className="commit">

				<form
					action={`/${this.props.user.slug}/${this.props.keyboard.slug}/commits`}
					accept-charset="UTF-8"
					method="post">

					<input type="hidden" name="utf8" value="✓"/>

					<input type="hidden" name="authenticity_token" value={this.props.authenticity_token}/>

					<input type="hidden" name="commit[parent_id]" value={this.props.parent_id}/>


					<input type="hidden" name="commit[layers]" value={this.state.changes}/>


					<input type="text" name="commit[name]" value={this.state.name} onChange={this.onChangeName.bind(this)}/>

					<textarea type="text" name="commit[description]" value={this.state.description} onChange={this.onChangeDescription.bind(this)}/>


					<input type="submit" name="submit" value="Create Commit" onClick={this.submit.bind(this)}/>
				</form>

				<Editor
					ref="Editor"
					data={this.props.data}
					editable={true}
				/>

			</div>
	}
}