require! {
    \require-ls
    \supertest
    \moment
    \./app.ls
}

now = moment.utc!.format!

err, res <-! supertest(app)
  .post \/insert
  .send({ date: now, rates: {} })
  .expect 200
  .end

throw err if err?



err, res <-! supertest(app)
  .get "/get-closest/#now"
  .expect 200
  .end
throw err if err? 
console.log res.text
process.exit!