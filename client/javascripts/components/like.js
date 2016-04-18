export default class Like extends React.Component {

	constructor (props) {
		super(props)

		this.state = {
			action: props.liked ? 'unlike' : 'like',
			likes: props.likes
		}
	}

	toggleAction () {
		if (this.state.action == 'like') {
			this.setState({action: 'unlike'})
		} else {
			this.setState({action: 'like'})
		}
	}

	submit (event) {
		fetch(`/${this.props.user.name}/${this.props.keyboard.name}/${this.state.action}`, {
			method: 'PATCH'
		})
    	.then((response) => {
      		return response.json()
    	}).then((json) => {
    		this.toggleAction()
    		this.setState({likes: json.likes})
    	});

    	event.preventDefault()
	}

	render () {
		return <div className="like">
				<a onClick={this.submit.bind(this)}>{this.state.action}</a>
				<p>{this.state.likes}</p>
			</div>
	}
}