homeScore = require('./hes/interface')

# possible valid inputs can be found here
# https://developers.buildingsapi.lbl.gov/hes/documentation/php-5-api-sample-code
homeScore '02906', [{
  inputTableName: 'whole_house_input',
  inputColumnName: 'floorArea'
  s_value: '1800'
}], (data, error) ->
  throw(error) if (error)

  console.log data
