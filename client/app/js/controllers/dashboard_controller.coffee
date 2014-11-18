angular.module("app").controller "DashboardController", ($scope, $http) ->
  $scope.fetchPageViews = ->
    $http.get(
      "/v1/google_analytics/page_views"
    ).success (data) ->
      $scope.pageViews = data.response

  $scope.sortedPageViews = () ->

    if $scope.pageViews && $scope.pageViews.rows
      pages = $scope.pageViews.rows
      pages.sort((a, b) ->
        comparePageViews(a, b)
      ).slice(0, 5)

  comparePageViews = (a, b) ->
    return -1  if a[1] - b[1] > 0
    return 1  if a[1] - b[1] < 0
    0



