Meteor.Router.add
  '/': 'landingPage'
  '/about': 'aboutPage'
  '/races': 'racesList'
  '/results': 'resultsList'
  '/login': 'loginPage'
  '/register': 'registerPage'
  '/settings': 'settingsPage'

Meteor.Router.filters
  'requireLogin': (page) ->
    if Meteor.user()
      return page
    else if Meteor.loggingIn()
      return 'loading'
    else
      return 'accessDenied'

Meteor.Router.filter 'requireLogin', {
  only: ['racesList', 'settingsPage']
}
