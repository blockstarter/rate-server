require! {
    \express
    \mongojs
    \moment
    \body-parser
}

db = mongojs \rates, [\rates]

app = express!

app.use body-parser.json!

get-iso = (date)->
    moment.utc(date).to-date!.toISOString!

app.post \/insert, (req, res)->
    { date, rates } = req.body
    iso = get-iso date
    <-! db.rates.save { iso, rates }
    res.send {ok: yes}
app.get \/get-closest/:date, (req, res)->
    
    iso = get-iso req.params.date
    query = iso : $lte: iso
    err, items <-! db.rates.find(query).sort( iso : -1 ).limit(1)
    return res.status(404).end! if items.length is 0
    res.send items.0
module.exports = app