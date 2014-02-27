xmlParser  = require('xml2json')
soap       = require("soap")
url        = 'http://sbapp.hescloud.net/session/wsdl'
HES_ID     = process.env['HES_ID']

throw(new Error("you must expose your HES_ID in your env")) unless HES_ID?

soap.createClient url, (err, client) ->
  throw(err) if (err)
  client.newSession({
    client_guid: HES_ID,
    zipcode: '02906',
    website_type: 0
  }, (e, d, b) ->
    json    = JSON.parse(xmlParser.toJson(b));
    # a lot of data is returned (61 std class objects, each with 19 fields), this is designed to build the forms on a GUI website; for the present exercise we only need the session id.
    session = json['SOAP-ENV:Envelope']['SOAP-ENV:Body']['ns1:newSessionResponse']['return']['item'].pop().sessionValue['$t'].split("^")[1].split(';')[0]
    calcHome(session, client)
  )
calcHome = (session, client) ->
  client.retrieveDetailedSessionResults11({
    client_guid: HES_ID,
    session_id: session
  }, (e,d,b) ->
    console.log(b)
  )
