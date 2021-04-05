import axios from 'axios'

const http = axios.create(
    {
        baseURL: 'http://localhost:3000/stop/web/api'
    }
)

export default http