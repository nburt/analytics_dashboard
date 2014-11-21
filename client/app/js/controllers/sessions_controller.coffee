angular.module("app").controller "SessionsController", ($scope, $http) ->
  $scope.fetchSessions = ->
    $http.get(
      "/v1/google_analytics/sessions"
    ).success (data) ->
      $scope.sessions = data.response

  $scope.sortedSessions = () ->
    if $scope.sessions && $scope.sessions.rows
      pages = $scope.sessions.rows
      pages.sort((a, b) ->
        compareSessions(a, b)
      ).slice(0, 5)

  compareSessions = (a, b) ->
    return -1  if a[1] - b[1] > 0
    return 1  if a[1] - b[1] < 0
    0
