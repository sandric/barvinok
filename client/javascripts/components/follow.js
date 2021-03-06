export default class Follow extends React.Component {

	constructor (props) {
		super(props)

		this.state = {
			action: props.follows ? 'unfollow' : 'follow',
			followers: props.followers
		}
	}

	toggleAction () {
		if (this.state.action == 'follow') {
			this.setState({action: 'unfollow'})
		} else {
			this.setState({action: 'follow'})
		}
	}

	submit (event) {

		let authenticityToken = document.querySelector('meta[name="csrf-token"]').content

		let action = ''

		if (this.props.keyboard) {
			action = `/${this.props.user.name}/${this.props.keyboard.name}/${this.state.action}`
		} else {
			action = `/${this.props.user.name}/${this.state.action}`
		}

		fetch(action, {
			method: 'PATCH',
			headers: {
				'Accept': 'application/json',
				'Content-Type': 'application/json',
				'X-CSRF-Token': authenticityToken,
				'X-Requested-With': 'XMLHttpRequest'
			},
			body: {
			}
		})
    	.then((response) => {
      		return response.json()
    	}).then((json) => {
    		this.toggleAction()
    		this.setState({followers: json.followers})
    	});

    	event.preventDefault()
	}

	render () {
		return <div className="follow">
				<a onClick={this.submit.bind(this)}>{this.state.action}</a>
				<p>{this.state.followers}</p>
			</div>
	}
}