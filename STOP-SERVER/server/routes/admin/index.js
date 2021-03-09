module.exports= app=>{
    const express = require('express')
    const jwt = require('jsonwebtoken')
    const fs = require('fs')
    const router = express.Router({
        mergeParams : true
    })
    router.post("/signup",async(req,res)=>{   
        console.log("success") 
        const findUser = await req.Model.findOne({email:req.body.email})
        if(findUser!=null){
            res.send({"message":"email has been registered"});
        }
        else{
            const model = await req.Model.create(req.body)
            const email = req.body.email
            const currentUser = await req.Model.find({email})
            const token = jwt.sign({
                id: currentUser._id
            }, app.get('secret'))
            res.send({"Token":token,"email":email,"message":"success"})
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
    
    router.post("/login",async(req,res)=>{
        const findUser = await req.Model.findOne({email:req.body.email})
        if(findUser==null){
            res.send({"message":"cannot find this email address"})
        }
        else{
          const isValid = require('bcrypt').compareSync(req.body.password,findUser.password)
          if(!isValid){
              res.send({"message":"wrong password"})
          }
          else{
              res.send({"message":"success","email":req.body.email})
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