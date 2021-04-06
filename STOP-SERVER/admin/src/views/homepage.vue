<template>
    <div>
        <h2> This is page for developers, click every button below to add questions to you loacl database </h2>
         <el-button type="primary" @click="uploadPractiseItem">add practise item</el-button>
         <br><br>
         <el-button type="primary" @click="uploadControlItem">add control item</el-button>
         <br><br>
         <el-button type="primary" @click="uploadMinusSocial">add minus social</el-button>
         <br><br>
         <el-button type="primary" @click="uploadMinusRelationship">add minus relationship</el-button>
         <br><br>
         <el-button type="primary" @click="uploadMinusFamily">add minus family</el-button>
         <br><br>
         <el-button type="primary" @click="uploadMinusWork">add minus work</el-button>
         <br><br>
         <el-button type="primary" @click="uploadMinusAcademic">add minus academic</el-button>
         <br><br>
         <el-button type="primary" @click="uploadMinusHobby">add minus hobby</el-button>
         <br><br>
         <el-button type="primary" @click="uploadMinusMood">add minus mood</el-button>
         <br><br>
    </div>
</template>

<script>
export default {
    methods:{
        async uploadPractiseItem(){
             const res = await this.$http.post('/rest/practiseitems')
             if(res.data.message=="success"){
                 this.$message({
                     type: "success",
                     message: "successfully added!"
                 })
             }
        },
        async uploadMinusSocial(){
            const res = await this.$http.post('/rest/minussocials')
            if(res.data.message=="success"){
                 this.$message({
                     type: "success",
                     message: "successfully added!"
                 })
             }
        },
        async uploadControlItem(){
            const res = await this.$http.post('/rest/controlitems')
            if(res.data.message=="success"){
                 this.$message({
                     type: "success",
                     message: "successfully added!"
                 })
             }
        },
        async uploadMinusRelationship(){
            const res = await this.$http.post('/rest/minusrelationships')
            if(res.data.message=="success"){
                 this.$message({
                     type: "success",
                     message: "successfully added!"
                 })
             }
        },
        async uploadMinusFamily(){
            const res = await this.$http.post('/rest/minusfamilies')
            if(res.data.message=="success"){
                 this.$message({
                     type: "success",
                     message: "successfully added!"
                 })
             }
        },
         async uploadMinusWork(){
            const res = await this.$http.post('/rest/minusworks')
            if(res.data.message=="success"){
                 this.$message({
                     type: "success",
                     message: "successfully added!"
                 })
             }
        },
         async uploadMinusAcademic(){
            const res = await this.$http.post('/rest/minusacademics')
            if(res.data.message=="success"){
                 this.$message({
                     type: "success",
                     message: "successfully added!"
                 })
             }
        },
         async uploadMinusHobby(){
            const res = await this.$http.post('/rest/minushobbies')
            if(res.data.message=="success"){
                 this.$message({
                     type: "success",
                     message: "successfully added!"
                 })
             }
        },
         async uploadMinusMood(){
            const res = await this.$http.post('/rest/minusmoods')
            if(res.data.message=="success"){
                 this.$message({
                     type: "success",
                     message: "successfully added!"
                 })
             }
        },
        // async testApi(){
        //     const res = await this.$http.post('/rest/users/signup',{"email":"AA001","password":'123456'})
        //     console.log(res.data)
        // },
        // async testApi2(){
        //      const res = await this.$http.get('/rest/controlitems')
        //     console.log(res.data)
        // }
    }
}
</script>