class User extends React.Component {

	constructor (props) {
		super(props)

		this.state = {
			name: props.user.name,
			email: props.user.email,
			avatarPreviewUrl: "",
			avatarId: "",
			password: "",
			passwordConfirmation: "",
			currentPassword: ""
		}
	}


	getAvatarUrl () {
		
		var input = document.getElementById('user_avatar')
        
        if (input.files && input.files[0]) {
            
            var reader = new FileReader()
            
            reader.onload = (event) =>  {
                this.setState({
                	avatarPreviewUrl: event.target.result,
                	avatarId: document.getElementsByName('user[avatar]')[0].value
                })
            }
            
            reader.readAsDataURL(input.files[0])
        }
    }


    componentDidMount() {
        document.getElementById('edit-user').addEventListener("upload:success", () => { 
			this.getAvatarUrl()
		})
    }


	onChangeName (event) {
		this.setState({name: event.target.value})
	}

	onChangeEmail (event) {
		this.setState({email: event.target.value})
	}

	onChangePassword (event) {
		this.setState({password: event.target.value})
	}

	onChangePasswordConfirmation (event) {
		this.setState({passwordConfirmation: event.target.value})
	}

	onChangeCurrentPassword (event) {
		this.setState({currentPassword: event.target.value})
	}


	generateAvatarFieldMarkup () { 
		return {__html: marked(this.props.avatar_field)} 
	}



	submit (event) {
		event.preventDefault();
	}

	render () {

		return (

			<div className="user">

				<img className="avatar-preview" src={this.state.avatarPreviewUrl}/>

				<form class="edit_user"
					id="edit-user"
					enctype="multipart/form-data"
					action="/users"
					accept-charset="UTF-8"
					method="post">

					<input name="utf8" type="hidden" value="✓"/>

					<input type="hidden" name="_method" value="put"/>

					<input type="hidden" name="authenticity_token" value={this.props.authenticity_token}/>
				  

				  	<div className="avatarField"
						dangerouslySetInnerHTML={this.generateAvatarFieldMarkup()}>
					</div>

					<input type="hidden" value={this.state.avatarId} name="user[avatar]"/>


				    <input autofocus="autofocus" placeholder="username" type="text" value={this.state.name} onChange={this.onChangeName.bind(this)} name="user[name]"/>
				    <br/>
				    <input autofocus="autofocus" placeholder="email" type="email" value={this.state.email} onChange={this.onChangeEmail.bind(this)} name="user[email]"/>
				    <br/>
				    <input autocomplete="off" placeholder="password" type="password" value={this.state.password} onChange={this.onChangePassword.bind(this)} name="user[password]"/>
				    <br/>
				    <input autocomplete="off" placeholder="password confirmation" type="password" value={this.state.passwordConfirmation} onChange={this.onChangePasswordConfirmation.bind(this)} name="user[password_confirmation]"/>
				    <br/>
				    <input autocomplete="off" placeholder="current password" type="password" value={this.state.currentPassword} onChange={this.onChangeCurrentPassword.bind(this)} name="user[current_password]"/>
				    <br/>

				    <input type="submit" name="commit" value="Update" data-disable-with="Update" onClick={this.submit.bind(this)}/>

				</form>

			</div>

		)
	}
}