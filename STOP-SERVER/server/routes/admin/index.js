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
                await req.Model.create({email:req.body.email,password:req.body.password,userid:userid,controlitem:true})
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
                await req.Model.create({email:req.body.email,password:req.body.password,userid:finalstr,controlitem:controlitem})
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

    router.post("/",async(req,res)=>{
        const modelName = require('inflection').classify(req.params.resource)
        const ItemPath = `./questions/${modelName}.json`
        fs.readFile(ItemPath,'utf-8',  async function(err,data){
            if(err){
                console.log(err)
            }
           const Items = JSON.parse(data).Item
           const firstContext = Items[0].context
           const findFirst =  await req.Model.findOne({"context":firstContext})
            if(findFirst){
                res.status(403).send({"message":"就知道你会再点一次的!!"})
            }else{
                for(var i =0;i<Items.length;i++){
                    req.Model.create(Items[i])
                    }        
                res.send({"message":"success"})
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
          else{
              res.send({"message":"success","userid":req.body.userid})
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