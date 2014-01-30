var soap = require("soap");
var url = 'http://trk-hesapici-sb.hescloud.net/st_api/wsdl';

soap.createClient(url, function(err, client) {
  if (err){
    throw(err);
  } else {
    client.submit_address({}, function(e, r){
      console.log(e, r)
    });
  }
});