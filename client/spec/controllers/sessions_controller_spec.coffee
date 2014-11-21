describe 'SessionsController', ->
  $rootScope = null
  $controller = null
  $httpBackend = null

  beforeEach ->
    module("app")

  beforeEach inject(($injector) ->
    $httpBackend = $injector.get("$httpBackend")
    $rootScope = $injector.get("$rootScope")
    $controller = $injector.get("$controller")
    $controller('SessionsController', {$scope: $rootScope})
  )

  afterEach ->
    $httpBackend.verifyNoOutstandingExpectation()
    $httpBackend.verifyNoOutstandingRequest()

  describe 'google analytics sessions', ->
    it 'fetches the sessions from the core app', ->
      $httpBackend.expectGET('/v1/google_analytics/sessions').respond(
        200, sessions.success
      )

      $rootScope.fetchSessions()
      $httpBackend.flush()
      expect($rootScope.sessions).toEqual(sessions.success.response)

  describe 'sorting sessions', ->
    it 'takes an array of pages and returns the five with the highest page views', ->
      $rootScope.sessions = sessions.success.response
      expected = [
        ['/', '4'],
        ['/blog/sinatra-task-manager-part-2-extracting-a-class', '4'],
        ['/blog/the-fastest-json-parser-for-ruby', '4'],
        ['/blog', '3']
        ['/portfolio', '1']
      ]
      expect($rootScope.sortedSessions()).toEqual(expected)
