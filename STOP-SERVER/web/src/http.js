import axios from 'axios'

const http = axios.create(
    {
        baseURL: process.env.VUE_APP_API_URL || '/stop/web/api'
        //baseURL: 'http://localhost:3000/stop/web/api'
    }
)

export default http