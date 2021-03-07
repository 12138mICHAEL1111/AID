
module.exports= app=>{
    const express = require('express')
    const jwt = require('jsonwebtoken')
    const User  = require('../../models/User')
    const router = express.Router({
        mergeParams : true
    })
    router.post("/signin",async(req,res)=>{    
        const findUser = await User.findOne({email:req.body.email})
        if(findUser!=null){
            res.send({"message":"email has been registered"});
        }
        else{
            const model = await User.create(req.body)
            const email = req.body.email
            const currentUser = await User.find({email})
            const token = jwt.sign({
                id: currentUser._id
            }, app.get('secret'))
            res.send({"Token":token,"email":email,"message":"success"})
        }   
    })

    router.post("/login",async(req,res)=>{
        const findUser = await User.findOne({email:req.body.email})
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
    app.use('/stop/api',router)

  
}