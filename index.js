var xmlParser = require('xml2json');
var soap = require("soap");
var url = 'http://sbapp.hescloud.net/session/wsdl';

soap.createClient(url, function(err, client) {
  if (err){
    throw(err);
  } else {
    client.newSession({
      client_guid: HES_ID,
      zipcode: '02906',
      website_type: 0
    }, function(e, d, b) {
      var json    = JSON.parse(xmlParser.toJson(b));
      //a lot of data is returned (61 std class objects, each with 19 fields), this is designed to build the forms on a GUI website; for the present exercise we only need the session id.
      var session = json['SOAP-ENV:Envelope']['SOAP-ENV:Body']['ns1:newSessionResponse']['return']['item'].pop().sessionValue['$t'].split("^")[1].split(';')[0];
      calcHome(session, client);
    });
  }
});

function calcHome(session, client) {
  client.retrieveDetailedSessionResults11({
    client_guid: HES_ID,
    session_id: session
  }, function(e,d,b) {
    console.log(b);
  });
};
