Template.registerPage.events
  'submit #register-form': (e, form) ->
    e.preventDefault()

    trimInput = (val) ->
      val.replace /^\s*|\s*$/g, ''

    isValidPassword = (val) ->
      if val.length > 5
        return true
      else
        throwAlert 'password too short'
        return false

    username = trimInput form.find('#account-username').value
    email = trimInput form.find('#account-email').value
    password = form.find('#account-password').value

    # trim and validate input

    if isValidPassword(password)
      profile = { name: '' }
      Accounts.createUser { username, email, password, profile }, (err) ->
        if (err)
          # account creation failed
          console.log err
        else
          # success
          Meteor.Router.to '/'

    return false
