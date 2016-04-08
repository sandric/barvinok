class Markdown extends React.Component {

	constructor () {
		super()
	}

	generateMarkup () { 
		return {__html: marked(this.props.data)}; 
	}

	render () {

		return (
			<div 
				className={this.props.hidden ? 'hidden' : 'markdown'} 
				dangerouslySetInnerHTML={this.generateMarkup()}>
			</div>
		)
	}
}