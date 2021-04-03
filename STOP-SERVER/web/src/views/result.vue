<template>
    <div >
        <div>
            <h1>Search results for user '{{userid}}':</h1>
        </div>
        <div >
            <span>catergory: {{category}}</span>
        </div>
        <hr>
        <div class="moodtable">
            <div class="beforemood">
                <div>
                <span> before training mood:</span>
                </div>  
                <el-table
                    :data="moodTable"
                    border
                    style="width: 360px"
                >
                    <el-table-column
                    prop="sessionnumber"
                    label="session number"
                    width="150">
                    </el-table-column>
                    <el-table-column
                    prop="axious"
                    label="axious"
                    width="70">
                    </el-table-column>
                    <el-table-column
                    prop="happy"
                    label="happy"
                    width="70">
                    </el-table-column>
                    <el-table-column
                    prop="sad"
                    label="sad"
                    width="70">
                    </el-table-column>
                </el-table>
                
            </div>
            <div class="aftermood">
                <div>
                    <span> after training mood:</span>
                </div>      
                    <el-table
                        :data="aftermoodTable"
                        border
                        style="width: 360px">
                        <el-table-column
                        prop="sessionnumber"
                        label="session number"
                        width="150">
                        </el-table-column>
                        <el-table-column
                        prop="axious"
                        label="axious"
                        width="70">
                        </el-table-column>
                        <el-table-column
                        prop="happy"
                        label="happy"
                        width="70">
                        </el-table-column>
                        <el-table-column
                        prop="sad"
                        label="sad"
                        width="70">
                        </el-table-column>
                    </el-table>
                </div>
        </div>
        <span> * '1' means most negative, '5' means most postive</span>
        <hr>
        <div class='questiondeatil'>
            <span>detail data for specific questions</span>
                <el-table
                        :data="questionTable"
                        border
                        style="width: 100%">
                        <el-table-column
                        prop="sessionnumber"
                        label="question number"
                        width="150">
                        </el-table-column>
                        <el-table-column
                        prop="axious"
                        label="session number"
                        width="150">
                        </el-table-column>
                        <el-table-column
                        prop="happy"
                        label="reading duration"
                        width="150">
                        </el-table-column>
                        <el-table-column
                        prop="sad"
                        label="wordRT1"
                        width="150">
                        </el-table-column>
                         <el-table-column
                        prop="sad"
                        label="wordAccuracy1"
                        width="150">
                        </el-table-column>
                         <el-table-column
                        prop="sad"
                        label="clueRequired"
                        width="150">
                        </el-table-column>
                         <el-table-column
                        prop="sad"
                        label="wordRT2"
                        width="150">
                        </el-table-column>
                         <el-table-column
                        prop="sad"
                        label="questionRT1"
                        width="150">
                        </el-table-column>
                         <el-table-column
                        prop="sad"
                        label="questionAccuracy1"
                        width="150">
                        </el-table-column>
                          <el-table-column
                        prop="sad"
                        label="questionRT2"
                        width="150">
                        </el-table-column>
                         <el-table-column
                        prop="sad"
                        label="questionAccuracy2"
                        width="150">
                        </el-table-column>
                 </el-table>
        </div>
    </div>
</template>

<style >
    .moodtable{
        display: flex;
        flex-wrap: wrap;
    }
    .beforemood{
        margin-right:100px
    }
    
</style>

<script>
export default {
    data(){
        return{
            userid:"",
            category:'',
            sessionmood:{},
            moodTable: [],
            aftermood:{},
            aftermoodTable:[],
            questionTable:[]
        }
    },
    methods:{
        async fetch(){
            this.userid=this.$route.params.id
            const categoryres = await this.$http.get(`/rest/users/getcategory/${this.userid}`)
            this.category=categoryres.data.category
            const sessionmoodres= await this.$http.get(`/rest/users/sessionmood/${this.userid}`)
            this.sessionmood= sessionmoodres.data.sessionmood
            this.moodTable.push({"sessionnumber":1,"axious":this.sessionmood.session1[0],'happy':this.sessionmood.session1[1],"sad":this.sessionmood.session1[2]})
            this.moodTable.push({"sessionnumber":2,"axious":this.sessionmood.session2[0],'happy':this.sessionmood.session2[1],"sad":this.sessionmood.session2[2]})
            this.moodTable.push({"sessionnumber":3,"axious":this.sessionmood.session3[0],'happy':this.sessionmood.session3[1],"sad":this.sessionmood.session3[2]})
            this.moodTable.push({"sessionnumber":4,"axious":this.sessionmood.session4[0],'happy':this.sessionmood.session4[1],"sad":this.sessionmood.session4[2]})
            const aftersessionmoodres= await this.$http.get(`/rest/users/aftersessionmood/${this.userid}`)
            this.aftermood = aftersessionmoodres.data.aftersessionmood
            this.aftermoodTable.push({"sessionnumber":1,"axious":this.aftermood.session1[0],'happy':this.aftermood.session1[1],"sad":this.aftermood.session1[2]})
            this.aftermoodTable.push({"sessionnumber":2,"axious":this.aftermood.session2[0],'happy':this.aftermood.session2[1],"sad":this.aftermood.session2[2]})
            this.aftermoodTable.push({"sessionnumber":3,"axious":this.aftermood.session3[0],'happy':this.aftermood.session3[1],"sad":this.aftermood.session3[2]})
            this.aftermoodTable.push({"sessionnumber":4,"axious":this.aftermood.session4[0],'happy':this.aftermood.session4[1],"sad":this.aftermood.session4[2]})
        }
    },
    created(){
         this.fetch()
    }
}
</script>