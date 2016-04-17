import React from 'react';

import MarkdownEditor from './markdown_editor'


export default class Keyboard extends React.Component {

	constructor (props) {
		super(props)

		this.state = {
			changes: props.keyboard.description || "",
			name: props.keyboard.name || ""
		}
	}

	onChangeName(event) {
		this.setState({name: event.target.value})
	}

	submit () {
		this.setState({changes: this.refs.MarkdownEditor.getChanges()})
	}

	render () {

		if (this.props.action == 'new') {
			var submitAction = 'Create keyboard'
			var formAction = `/${this.props.user.name}/keyboards/`
			var method = 'post'
			var mode = 'edit'
		}
		else if (this.props.action == 'edit') {
			var submitAction = 'Update keyboard'
			var formAction = `/${this.props.user.name}/${this.props.keyboard.name}/`
			var method = 'patch'
			var mode = 'edit'
		}

		return <div className="talk">

				<form
					action={formAction}
					accept-charset="UTF-8"
					method="post">

					<input name="utf8" type="hidden" value="✓"/>

					<input type="hidden" name="_method" value={method}/>

					<input type="hidden" name="authenticity_token" value={this.props.authenticity_token}/>

					<input type="text" value={this.state.name} name="keyboard[name]" onChange={this.onChangeName.bind(this)}/>

					<input type="hidden" value={this.state.changes} name="keyboard[description]"/>

					<input type="submit" name="commit" value={submitAction} onClick={this.submit.bind(this)}/>
				</form>

				<MarkdownEditor
					ref="MarkdownEditor"
					data={this.props.keyboard.description}
					editable={true}
					mode={mode}
				/>

			</div>
	}
}