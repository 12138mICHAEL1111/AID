module.exports= app=>{
    const express = require('express')
    const router = express.Router({
        mergeParams : true
    })

    router.get('/getcategory/:id',async(req,res)=>{
        const findUser = await req.Model.findOne({userid:req.params.id})      
         const category = findUser.category
         res.send({"category":category})
    })

    router.get('/findoneuser/:id',async(req,res)=>{
        const findUser = await req.Model.findOne({userid:req.params.id})      
        if(findUser){
         res.send({"message":"success"})
        }
        else{
            res.send({"message":"fail"})
        }
    })

    router.get('/aftersessionmood/:id',async(req,res)=>{
        const findUser = await req.Model.findOne({userid:req.params.id})   
        res.send({"aftersessionmood":findUser.aftersessionmood})
    })

    router.get('/sessionmood/:id',async(req,res)=>{
        const findUser = await req.Model.findOne({userid:req.params.id})      
        res.send({"sessionmood":findUser.sessionmood})
    })
    const resource = require("../../middleware/resource")
    app.use('/stop/web/api/rest/:resource',resource(),router)
}