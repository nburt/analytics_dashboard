angular.module("app").controller "BounceRatesController", ($scope, $http) ->
  $scope.fetchBounceRates = ->
    $http.get(
      "/v1/google_analytics/bounce_rates"
    ).success (data) ->
      $scope.bounceRates = data.response

  $scope.sortedBounceRates = () ->
    if $scope.bounceRates && $scope.bounceRates.rows
      pages = $scope.bounceRates.rows
      pages.sort((a, b) ->
        compareBounceRates(a, b)
      ).slice(0, 5)

  compareBounceRates = (a, b) ->
    return -1  if a[1] - b[1] > 0
    return 1  if a[1] - b[1] < 0
    0
