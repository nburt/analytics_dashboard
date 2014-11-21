bounceRates = {
  success: {
    response: {
      "kind": "analytics#gaData",
      "id": "https://www.googleapis.com/analytics/v3/data/ga?ids=ga:83626939&dimensions=ga:pagePath&metrics=ga:bounceRate&start-date=2014-10-22&end-date=2014-11-20", "query": {"start-date": "2014-10-22", "end-date": "2014-11-20", "ids": "ga:83626939", "dimensions": "ga:pagePath", "metrics": ["ga:bounceRate"], "start-index": 1, "max-results": 1000}, "itemsPerPage": 1000, "totalResults": 9, "selfLink": "https://www.googleapis.com/analytics/v3/data/ga?ids=ga:83626939&dimensions=ga:pagePath&metrics=ga:bounceRate&start-date=2014-10-22&end-date=2014-11-20",
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
        {"name": "ga:pagePath", "columnType": "DIMENSION", "dataType": "STRING"},
        {"name": "ga:bounceRate", "columnType": "METRIC", "dataType": "PERCENT"}
      ],
      "totalsForAllResults": {
        "ga:bounceRate": "58.82352941176471"
      },
      "rows": [
        ["/", "50.0"],
        ["/blog", "0.0"],
        ["/blog/building-my-first-real-website", "0.0"],
        ["/blog/sinatra-task-manager-part-2-extracting-a-class", "100.0"],
        ["/blog/team-escape-boulder-wins-first-hackfest", "0.0"],
        ["/blog/the-fastest-json-parser-for-ruby", "75.0"],
        ["/portfolio", "0.0"],
        ["/resume", "100.0"],
        ["/tags/json", "0.0"]
      ]
    }
  }
};