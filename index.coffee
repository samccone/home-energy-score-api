homeScore = require('./hes/interface')

# possible valid inputs can be found here
# https://developers.buildingsapi.lbl.gov/hes/documentation/php-5-api-sample-code
homeScore '02906', [
  {
    inputTableName: "whole_house_input",
    inputColumnName: "address",
    s_value: "147 Benefit St # 3"
  }, {
    inputTableName: "whole_house_input",
    inputColumnName: "city",
    s_value: " Providence"
  }, {
    inputTableName: "whole_house_input",
    inputColumnName: "stateCode",
    s_value: "RI"
  }, {
    inputTableName: "whole_house_input",
    inputColumnName: "year",
    s_value: "1961"
  }, {
    inputTableName: "whole_house_input",
    inputColumnName: "priceElect",
    s_value: "0.145"
  }, {
    inputTableName: "whole_house_input",
    inputColumnName: "priceGas",
    s_value: "1.36"
  }, {
    inputTableName: "whole_house_input",
    inputColumnName: "priceLpg",
    s_value: "23.24"
  }, {
    inputTableName: "whole_house_input",
    inputColumnName: "priceOil",
    s_value: "12.52"
  }, {
    inputTableName: "whole_house_input",
    inputColumnName: "storiesAboveGround",
    s_value: "1"
  }, {
    inputTableName: "whole_house_input",
    inputColumnName: "floorArea",
    s_value: "Yes"
  }, {
    inputTableName: "whole_house_input",
    inputColumnName: "foundationType",
    s_value: "uncond_base"
  }, {
    inputTableName: "whole_house_input",
    inputColumnName: "ceilingConstruction",
    s_value: "ecwf11"
  }, {
    inputTableName: "whole_house_input",
    inputColumnName: "roofConstruction",
    s_value: "rfwf00co"
  }, {
    inputTableName: "whole_house_input",
    inputColumnName: "atticType",
    s_value: "uncond_attic"
  }, {
    inputTableName: "whole_house_input",
    inputColumnName: "wallConstructionFront",
    s_value: "ewwf03wo"
  }, {
    inputTableName: "whole_house_input",
    inputColumnName: "wallConstructionFront",
    s_value: "Yes"
  }
], (data, error) ->
  throw(error) if (error)

  console.log data
