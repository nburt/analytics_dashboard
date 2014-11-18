module.exports = drawRoutes: (app) ->
  app.get "/v1/page_views", (req, res) ->
    res.json {
      "kind": "analytics#gaData",
      "id": "https://www.googleapis.com/analytics/v3/data/ga?ids=ga:83626939&dimensions=ga:pagePath&metrics=ga:pageviews&start-date=2014-10-14&end-date=2014-11-13",
      "query": {
        "start-date": "2014-10-14",
        "end-date": "2014-11-13",
        "ids": "ga:83626939",
        "dimensions": "ga:pagePath",
        "metrics": ["ga:pageviews"],
        "start-index": 1,
        "max-results": 1000
      },
      "itemsPerPage": 1000,
      "totalResults": 12,
      "selfLink": "https://www.googleapis.com/analytics/v3/data/ga?ids=ga:83626939&dimensions=ga:pagePath&metrics=ga:pageviews&start-date=2014-10-14&end-date=2014-11-13",
      "profileInfo": {
        "profileId": "83626939",
        "accountId": "49126926",
        "webPropertyId": "UA-49126926-1",
        "internalWebPropertyId": "80805931",
        "profileName": "All Web Site Data",
        "tableId": "ga:83626939"
      },
      "containsSampledData": false,
      "columnHeaders": [
        {
          "name": "ga:pagePath",
          "columnType": "DIMENSION",
          "dataType": "STRING"
        },
        {
          "name": "ga:pageviews",
          "columnType": "METRIC",
          "dataType": "INTEGER"
        }
      ],
      "totalsForAllResults": {
        "ga:pageviews": "51"
      },
      "rows": [
        ["/", "9"],
        ["/blog", "10"],
        ["/blog/building-my-first-real-website", "1"],
        ["/blog/creating-a-task-manager-with-sinatra-a-step-by-step-guide", "1"],
        ["/blog/sinatra-task-manager-part-2-extracting-a-class", "4"],
        ["/blog/team-escape-boulder-wins-first-hackfest", "3"],
        ["/blog/the-fastest-json-parser-for-ruby", "3"],
        ["/blog/the-first-three-weeks-at-gschool", "1"],
        ["/blog/why-i-decided-to-become-a-computer-programmer", "1"],
        ["/portfolio", "10"],
        ["/resume", "7"],
        ["/tags/json", "1"]
      ]
    }

