w          = require 'when'
nodefn     = require 'when/node/function'
xmlParser  = require 'xml2json'
soap       = require 'soap'

url        = 'http://sbapp.hescloud.net/session/wsdl'
HES_ID     = process.env['HES_ID']

throw(new Error("you must expose your HES_ID in your env")) unless HES_ID?

# extract session ID from initial client handshake
getSessionId = (body, client) ->
  json    = JSON.parse(xmlParser.toJson(body))

  # a lot of data is returned (61 std class objects, each with 19 fields), this is designed to build the forms on a GUI website; for the present exercise we only need the session id.
  session = json['SOAP-ENV:Envelope']['SOAP-ENV:Body']['ns1:newSessionResponse']['return']['item'].pop().sessionValue['$t'].split("^")[1].split(';')[0]
  [session, client]

# create initial session with the HES api
createSession = (zip, client) ->
  nodefn.call(client.newSession,
    {
      client_guid: HES_ID,
      zipcode: zip,
      website_type: 0
    }
  ).spread (d, b)-> [b, client]

# enter home detail fields
inputHomeDetails = (session, client, details) ->
  nodefn.call(client.saveSession11,
    {
      client_guid: HES_ID,
      session_id: session,
      input_array: details,
      validate: 1
    }
  ).then -> [session, client]

# get the possible home upgrades and savings
getUpgrades = (session, client) ->
  nodefn.call(client.retrieveSummarySessionResults11,
    {
      client_guid: HES_ID,
      session_id: session,
    }
  ).spread (d, b) ->
    # extract the response data we care about
    JSON.parse(xmlParser.toJson(b))['SOAP-ENV:Envelope']['SOAP-ENV:Body']['ns1:retrieveSummarySessionResults11Response']['return']

module.exports = (zip, details, cb) ->
  nodefn.call(soap.createClient, url)
        .then (client) -> createSession(zip, client)
        .spread(getSessionId)
        .spread (session, client) -> inputHomeDetails(session, client, details)
        .spread(getUpgrades)
        .done(cb)
