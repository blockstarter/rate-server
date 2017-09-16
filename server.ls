require! {
    \require-ls
    \./app.ls
}

app
 .use (req, res, next)->
    ip = req.headers['x-forwarded-for'] || req.connection.remoteAddress
    if ip is "209.126.69.46"
       next!
    else
      res.status(401).end!
 .listen 8080, ->
    console.log('Example app listening on port 8080!')
