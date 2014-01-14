Template.header.helpers
  'loggingIn': Meteor.loggingIn()
  'username': () ->
    if !Meteor.loggingIn()
      if Meteor.user().profile.name isnt ''
        return Meteor.user().profile.name
      else
        return Meteor.user().username

Template.header.events  
  'click .logout': (e) ->
    e.preventDefault()

    Meteor.logout()
    Meteor.Router.to '/'

