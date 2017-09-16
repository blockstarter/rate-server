require! {
    \require-ls
    \./app.ls
}

app.listen 8080, ->
  console.log('Example app listening on port 8080!')
