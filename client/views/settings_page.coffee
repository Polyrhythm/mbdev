Template.settingsPage.helpers
  'username': () ->
    if !Meteor.loggingIn()
      if Meteor.user().profile.name isnt ''
        return Meteor.user().profile.name
      else
        return Meteor.user().username

  'name': Meteor.user().profile.name

Template.settingsPage.events
  'submit #settings-form': (e, form) ->
    e.preventDefault()

    name = form.find('#name').value
    if name.trim() isnt ''
      Meteor.users.update({_id: Meteor.user()._id}, {$set:{"profile.name": name}}, (err) ->
        if err
          console.log err
      )

    return false
