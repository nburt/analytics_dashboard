angular.module("app").config ($routeProvider, $locationProvider) ->
  $locationProvider.html5Mode true
  $routeProvider.when "/",
    templateUrl: "dashboard.html"
    controller: "DashboardController"

  $routeProvider.otherwise redirectTo: "/"
