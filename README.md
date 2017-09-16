# Blockstarter's Rates Server

### Setup 

```
npm i livescript forever -g
npm i
```

### Start for debug

```
lsc server
```



### Start forever 

```
lsc -c server.ls
forever start server.js
```

### Usage 

```
GET \/get-closest/:date
```

```
POST \/insert 
{ 
   date: new Date(), 
   rates: {  ...  }
}
```