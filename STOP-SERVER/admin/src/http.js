import axios from 'axios'
import Vue from 'vue'
const http = axios.create(
    {
        baseURL: process.env.VUE_APP_API_URL || '/stop/api'
        //baseURL: 'http://localhost:3000/stop/api'
    }
)

http.interceptors.response.use(res => {
    return res
},err=>{
    if(err.response.data.message){
        Vue.prototype.$message({
            type: 'error',
            message: err.response.data.message}
            )}
            

    return Promise.reject(err)
})

export default http