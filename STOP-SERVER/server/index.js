const express = require("express")

const app = express()

app.use(require('cors')())
app.use(express.json())

require('./plugins/db')(app)
require("./routes/admin")(app)
require("./routes/web")(app)

app.set('secret', "er234r123fwer")
app.use('/admin',express.static(__dirname+'/admin'))
app.use('/',express.static(__dirname+'/web'))
var PORT = process.env.PORT || 3000
app.listen(PORT,()=>{
    console.log('http://localhost:3000');
});