Template.loginPage.events
  'submit #login-form': (e, form) ->
    e.preventDefault()
    # retrieve input field names
    username = form.find('#login-username').value
    password = form.find('#login-password').value

    # trim and validation
    
    # if validation passes
    Meteor.loginWithPassword username, password, (err) ->
      if err
        # user might not be found or pw incorrect
        console.log err
      else
        # logged in
        Meteor.Router.to '/'
  
    return false
