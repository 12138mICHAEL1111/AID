<template>
    <div>
        <h2> 一键增加页面 让你有开挂一般的编程体验</h2>
         <el-button type="primary" @click="uploadPractiseItem">一键增加practise item</el-button>
         <br><br>
         <el-button type="primary" @click="uploadControlItem">一键增加control item</el-button>
         <br><br>
         <el-button type="primary" @click="uploadMinusSocial">一键增加minus social</el-button>
         <br><br>
         <el-button type="primary" @click="uploadMinusRelationship">一键增加minus relationship</el-button>
         <br><br>
         <el-button type="primary" @click="uploadMinusFamily">一键增加minus family</el-button>
         <br><br>
         <el-button type="primary" @click="uploadMinusWork">一键增加minus work</el-button>
         <br><br>
         <el-button type="primary" @click="uploadMinusAcademic">一键增加minus academic</el-button>
         <br><br>
         <el-button type="primary" @click="uploadMinusHobby">一键增加minus hobby</el-button>
         <br><br>
         <el-button type="primary" @click="uploadMinusMood">一键增加minus mood</el-button>
         <br><br>
         <el-button type="primary" @click="testApi">接口测试</el-button>
         <a>可以在admin/src/views/homepage.vue 里的testapi方法里更改接口 摁f12 console控制台查看输出</a>
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
                     message: "添加成功!"
                 })
             }
        },
        async uploadMinusSocial(){
            const res = await this.$http.post('/rest/minussocials')
            if(res.data.message=="success"){
                 this.$message({
                     type: "success",
                     message: "添加成功!"
                 })
             }
        },
        async uploadControlItem(){
            const res = await this.$http.post('/rest/controlitems')
            if(res.data.message=="success"){
                 this.$message({
                     type: "success",
                     message: "添加成功!"
                 })
             }
        },
        async uploadMinusRelationship(){
            const res = await this.$http.post('/rest/minusrelationships')
            if(res.data.message=="success"){
                 this.$message({
                     type: "success",
                     message: "添加成功!"
                 })
             }
        },
        async uploadMinusFamily(){
            const res = await this.$http.post('/rest/minusfamilies')
            if(res.data.message=="success"){
                 this.$message({
                     type: "success",
                     message: "添加成功!"
                 })
             }
        },
         async uploadMinusWork(){
            const res = await this.$http.post('/rest/minusworks')
            if(res.data.message=="success"){
                 this.$message({
                     type: "success",
                     message: "添加成功!"
                 })
             }
        },
         async uploadMinusAcademic(){
            const res = await this.$http.post('/rest/minusacademics')
            if(res.data.message=="success"){
                 this.$message({
                     type: "success",
                     message: "添加成功!"
                 })
             }
        },
         async uploadMinusHobby(){
            const res = await this.$http.post('/rest/minushobbies')
            if(res.data.message=="success"){
                 this.$message({
                     type: "success",
                     message: "添加成功!"
                 })
             }
        },
         async uploadMinusMood(){
            const res = await this.$http.post('/rest/minusmoods')
            if(res.data.message=="success"){
                 this.$message({
                     type: "success",
                     message: "添加成功!"
                 })
             }
        },
        async testApi(){
            const res = await this.$http.get('/rest/minusmoods/session1')
            console.log(res.data)
        }
    }
}
</script>