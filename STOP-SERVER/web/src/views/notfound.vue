<template>
    <div >
        <h1>Sorry we cannot find data for '{{userid}}'</h1>
        <el-button type='primary' @click='goback'> go back</el-button>
    </div>
</template>

<script>
export default {
    data(){
        return{
            userid:""
        }
    },
    methods:{
        goback(){
            this.$router.go(-1)
        }
    },
    created(){
        this.userid= this.$route.params.id
    }
}
</script>