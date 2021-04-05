<template>
    <div class="fudiv">
        <div>
            <h1 class = 'title'>Searching data page </h1>
        </div>
        <div class="searchWidget">
            <div class="innerwidget">
                <el-input v-model="userid" placeholder="input user id"></el-input>
                <el-button icon="el-icon-search" type='primary' @click='search'></el-button>
            </div>
        </div>
    </div>
</template>

<style >
    .title{
        margin:0;
    }
    .fudiv{
        height:100vh;
    }
    .innerwidget{
        display: flex;
    }
    .searchWidget{
        height:40px;
        margin:auto;
        top:0;
        bottom:0;
        right:0;
        left:0;
        width:25%;
        position: absolute;
    }
</style>

<script>
export default {
    data(){
        return{
            userid:""
        }
    },
    methods:{
        async search(){
            if(this.userid==""){
                this.$message({
                    type:'warning',
                    message:'please input user id'
                })
            }else{
                const res = await this.$http.get(`/rest/users/findoneuser/${this.userid}`)
                if(res.data.message=="success"){
                    this.$router.push(`/search/${this.userid}`)
                }
                else{
                    this.$router.push(`/user/${this.userid}/notfound`)
                }
            }
            
        }    
    }
}
</script>