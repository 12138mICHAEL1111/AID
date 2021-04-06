const { Model } = require('mongoose')

module.exports= app=>{
    const express = require('express')
    const jwt = require('jsonwebtoken')
    const fs = require('fs')

    const router = express.Router({
        mergeParams : true
    })
    router.post("/signup",async(req,res)=>{   
        const findUser = await req.Model.findOne({email:req.body.email})
        var finalStrNum
        if(findUser!=null){
            res.send({"message":"email has been registered"});
        }
        else{
            const lastInsertData = await req.Model.find().sort({_id:-1}).limit(1)
            if(lastInsertData.length==0){
                const userid = "AA001"
                await req.Model.updateMany({currentuser: true}, { currentuser: false })
                await req.Model.create({ email: req.body.email, password: req.body.password, userid: userid, controlitem: true, currentuser: true })
                res.send({"userid":userid,"message":"success","controlitem":true})
            }
            else{
                const lastuserid= lastInsertData[0].userid
                const strnumber = lastuserid.substring(2)
                var firstletter =lastuserid.substring(0,1)
                var secondletter =lastuserid.substring(1,2)
                var finalstr
                const number = parseInt(strnumber) + 1
                if(number<10){
                    finalStrNum = "00"+number
                    finalstr = firstletter+secondletter+finalStrNum
                }
                else if(number<100 && number >=10){
                    finalStrNum = "0"+number
                    finalstr = firstletter+secondletter+finalStrNum
                }
                else{
                    finalStrNum = "" + number
                    if(finalStrNum=="1000"){
                        finalStrNum= "001"
                        if(secondletter=="Z"){
                            secondletter = "A"
                            firstletter = String.fromCharCode(firstletter.charCodeAt()+1)
                        }
                        else{
                            secondletter= String.fromCharCode(secondletter.charCodeAt()+1)
                        }
                    }
                    finalstr = firstletter+secondletter+finalStrNum
                }  
                var controlitem
                const finalNum = parseInt(finalStrNum)
                if(finalNum %2==0){
                    controlitem = false
                }
                else{
                    controlitem= true
                }
                await req.Model.updateMany({currentuser: true}, { currentuser: false })
                await req.Model.create({email:req.body.email,password:req.body.password,userid:finalstr,controlitem:controlitem,currentuser:true})
                const email = req.body.email
                res.send({"userid":finalstr,"message":"success","controlitem":controlitem})
            }
        
        //     await req.Model.create(req.body)
        //     const email = req.body.email
        //     const currentUser = await req.Model.find({email})
        //     const token = jwt.sign({
        //         id: currentUser._id
        //     }, app.get('secret'))
        //     res.send({"Token":token,"email":email,"message":"success"})
         }   
     })

    router.post("/uploadcategory",async(req,res)=>{
        await req.Model.findOneAndUpdate({userid:req.body.userid},{category:req.body.category})
        res.send({"message":"success"})
    })

    router.get("/uploadcategory",async(req,res)=>{
        const questions = await req.Model.find({ currentuser: true })
        res.send(questions)
    })

    router.get("/currentuser",async(req,res)=>{
        const user = await req.Model.find({ currentuser: true })
        res.send(user)
    })

    router.post("/uploadprogress",async(req,res)=>{
        const findUser = await req.Model.findOneAndUpdate({ userid: req.body.id }, { currentsession: req.body.session, currentitem: req.body.item })
        if(findUser==null){
            res.send({"message":"cannot find this id"})
        }
        else{
            res.send({"message":"success"})
        }
    })

    router.post("/senddata",async(req,res)=>{
        await req.Model.create(
            { userid: req.body.userid,
            trailNumber: req.body.trailNumber ,
            category: req.body.category ,
            sessionNumber: req.body.sessionNumber ,
            readingDuration : req.body.readingDuration,
            wordRT1: req.body.wordRT1 ,
            wordAccuracy1: req.body.wordAccuracy1 ,
            clueRequired: req.body.clueRequired ,
            wordRT2: req.body.wordRT2 ,
            wordAccuracy2: req.body.wordAccuracy2 ,
            questionRT1: req.body.questionRT1 ,
            questionAccuracy1: req.body.questionAccuracy1 ,
            questionRT2: req.body.questionRT2 ,
            questionAccuracy2: req.body.questionAccuracy2
            })
        res.send({"message":"success"})
    })

    router.post("/uploadsessiontime",async(req,res)=>{
        const finduser = await req.Model.findOneAndUpdate({userid:req.body.userid},{sessiontime:req.body.sessiontime})
        if(finduser){
            res.send({"messgae":"success"})
        }
        else{
            res.send({"messgae":"fail"})
        }
    })

    router.post("/sessiontime",async(req,res)=>{
        const user = await req.Model.findOne({userid:req.body.userid})
        res.send(user.sessiontime)
    })

    router.post("/uploadsessionmood",async(req,res)=>{
        const user = await req.Model.findOne({userid:req.body.userid})
        const session1mood = user.sessionmood.session1
        const session2mood = user.sessionmood.session2
        const session3mood = user.sessionmood.session3
        const session4mood = user.sessionmood.session4
        if(req.body.sessiontime == "session1"){
            await req.Model.findOneAndUpdate({userid:req.body.userid},{sessionmood:{session1:req.body.sessionmood,session2:session2mood,session3:session3mood,session4:session4mood}})
        }
        else if(req.body.sessiontime == "session2"){
            await req.Model.findOneAndUpdate({userid:req.body.userid},{sessionmood:{session1:session1mood,session2:req.body.sessionmood,session3:session3mood,session4:session4mood}})
        }
        else if(req.body.sessiontime == "session3"){
            await req.Model.findOneAndUpdate({userid:req.body.userid},{sessionmood:{session1:session1mood,session2:session2mood,session3:req.body.sessionmood,session4:session4mood}})
        }
        else{
            await req.Model.findOneAndUpdate({userid:req.body.userid},{sessionmood:{session1:session1mood,session2:session2mood,session3:session3mood,session4:req.body.sessionmood}}) 
        }

        res.sendStatus(200)
    })

    router.post("/uploadaftersessionmood",async(req,res)=>{
        const user = await req.Model.findOne({userid:req.body.userid})
        const session1mood = user.aftersessionmood.session1
        const session2mood = user.aftersessionmood.session2
        const session3mood = user.aftersessionmood.session3
        const session4mood = user.aftersessionmood.session4
        if(req.body.sessiontime == "session1"){
            await req.Model.findOneAndUpdate({userid:req.body.userid},{aftersessionmood:{session1:req.body.sessionmood,session2:session2mood,session3:session3mood,session4:session4mood}})
        }
        else if(req.body.sessiontime == "session2"){
            await req.Model.findOneAndUpdate({userid:req.body.userid},{aftersessionmood:{session1:session1mood,session2:req.body.sessionmood,session3:session3mood,session4:session4mood}})
        }
        else if(req.body.sessiontime == "session3"){
            await req.Model.findOneAndUpdate({userid:req.body.userid},{aftersessionmood:{session1:session1mood,session2:session2mood,session3:req.body.sessionmood,session4:session4mood}})
        }
        else{
            await req.Model.findOneAndUpdate({userid:req.body.userid},{aftersessionmood:{session1:session1mood,session2:session2mood,session3:session3mood,session4:req.body.sessionmood}}) 
        }

        res.sendStatus(200)
    })

    router.get("/:session",async(req,res)=>{
        const totalItems = await req.Model.find()
        var sessionItems = new Array()
        if(req.params.session == "session1"){            
            for(var i =0;i<18;i++){
                sessionItems.push(totalItems[i])
            }
        }
        else if(req.params.session == "session2"){
            for(var i =18;i<36;i++){
                sessionItems.push(totalItems[i])
            }
        }
        else if(req.params.session == "session3"){
            for(var i =36;i<54;i++){
                sessionItems.push(totalItems[i])
            }
        }
        else{
            for(var i =54;i<totalItems.length;i++){
                sessionItems.push(totalItems[i])
            }
        }
        res.send(sessionItems)
    })
    
    router.get("/",async(req,res)=>{
        const questions = await req.Model.find()
        res.send(questions)
    })

    router.post("/", async (req, res) => {
        const modelName = require('inflection').classify(req.params.resource)
            const ItemPath = `./questions/${modelName}.json`
            fs.readFile(ItemPath, 'utf-8', async function (err, data) {
                if (err) {
                    console.log(err)
                }
                const Items = JSON.parse(data).Item
                const firstContext = Items[0].context
                const findFirst = await req.Model.findOne({ "context": firstContext })
                if (findFirst) {
                    res.status(403).send({ "message": "You have already added once!!" })
                } else {
                    for (var i = 0; i < Items.length; i++) {
                        req.Model.create(Items[i])
                    }
                    res.send({ "message": "success" })
                }
            }
            )
    })

    router.post("/resetpassword",async(req,res)=>{
        const findUser = await req.Model.findOne({userid:req.body.userid})
        if(findUser == null || findUser.email!=req.body.email){
            res.send({"message":"fail"})
        }
        else{
            await req.Model.findOneAndUpdate({userid:req.body.userid},{password:req.body.password})
            res.send({"message":"success"})
        }

    })
    router.post("/getemail",async(req,res)=>{
        const findUser = await req.Model.findOne({userid:req.body.userid})
        const email = findUser.email
        res.send({"email":email})
    })
    router.post("/login",async(req,res)=>{
        const findUser = await req.Model.findOne({userid:req.body.userid})
        if(findUser==null){
            res.send({"message":"cannot find this id"})
        }
        else{
          const isValid = require('bcrypt').compareSync(req.body.password,findUser.password)
          if(!isValid){
              res.send({"message":"wrong password"})
          }
          else {
            await req.Model.updateMany({currentuser: true}, { currentuser: false })
            await req.Model.findOneAndUpdate({userid:req.body.userid}, { currentuser: true })
              res.send({"message":"success","userid":req.body.userid,"controlitem":findUser.controlitem,"currentuser": true,"currentitem":findUser.currentitem, "currentsession":findUser.currentsession, "category":findUser.category})
          }
        }
    })
    const resource = require("../../middleware/resource")
    app.use('/stop/api/rest/:resource',resource(),router)

    app.use(async(err,req,res,next)=>{
        res.status(err.statusCode || 500).send({
            message: err.message
        })
    })
}