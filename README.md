Home Energy Saver API
===================
http://hes.lbl.gov/

This is a simple to use `node.js` API interface for the HES SOAP based API.

## Using in your project
* `npm install hes-score`
  ```coffeescript
    require("hes-score")(zip, details, (response) =>
      console.log response
    )
  ```

## Using the demo file
* `EXPORT HES_ID="you_key";`
* `npm install`
* `npm start`


## Example
This is just a proof of concept example for how you can use this API interface.
The basic idea is as follows.

```coffee-script
homeScore ZIPCODE, [{
  inputTableName: 'whole_house_input',
  inputColumnName: 'floorArea'
  s_value: '1800'
}], (data, error) ->
  throw(error) if (error)
  console.log data
```

## API
* API DOCS (tend to not be 100% correct)
  * https://developers.buildingsapi.lbl.gov/hes/documentation/HES_API_methods
* PHP sample code
  *https://developers.buildingsapi.lbl.gov/hes/documentation/php-5-api-sample-code
