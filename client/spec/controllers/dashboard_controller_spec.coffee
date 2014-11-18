describe 'Dashboard Controller', ->
  $rootScope = null
  $controller = null
  $httpBackend = null

  beforeEach ->
    module("app")

  beforeEach inject(($injector) ->
    $httpBackend = $injector.get("$httpBackend")
    $rootScope = $injector.get("$rootScope")
    $controller = $injector.get("$controller")
    $controller('DashboardController', {$scope: $rootScope})
  )

  afterEach ->
    $httpBackend.verifyNoOutstandingExpectation()
    $httpBackend.verifyNoOutstandingRequest()

  describe 'google analytics page views', ->
    it 'fetches the page views from the core app', ->
      $httpBackend.expectGET('/v1/google_analytics/page_views').respond(
        200, pageViews.success
      )

      $rootScope.fetchPageViews()
      $httpBackend.flush()
      expect($rootScope.pageViews).toEqual(pageViews.success.response)

  describe 'sorting page views', ->
    it 'takes an array of pages and returns the five with the highest page views', ->
      $rootScope.pageViews = pageViews.success.response
      expected = [
        ['/portfolio', '10'],
        ['/blog', '10'],
        ['/', '9'],
        ['/resume', '7'],
        ['/blog/sinatra-task-manager-part-2-extracting-a-class', '4']
      ]
      expect($rootScope.sortedPageViews()).toEqual(expected)
