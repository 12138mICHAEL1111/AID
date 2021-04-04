<template>
    <div >
        <div>
            <h1>Searching results for user '{{userid}}':</h1>
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
        <span> * '1' means most postive, '5' means most negative</span>
        <hr>
        <div class='questiondeatil'>
            <span>detail data for specific questions</span>
                <el-table
                        :data="questionTable"
                        border
                        style="width: 100%">
                        <el-table-column
                        prop="questionnumber"
                        label="question number"
                        width="150">
                        </el-table-column>
                        <el-table-column
                        prop="sessionnumber"
                        label="session number"
                        width="150">
                        </el-table-column>
                        <el-table-column
                        prop="readingt"
                        label="reading duration(s)"
                        width="150">
                        </el-table-column>
                        <el-table-column
                        prop="wordrt1"
                        label="word reading time 1(ms)"
                        width="150">
                        </el-table-column>
                         <el-table-column
                        prop="wordac1"
                        label="word accuracy 1"
                        width="150">
                        </el-table-column>
                         <el-table-column
                        prop="clue"
                        label="clue required"
                        width="150">
                        </el-table-column>
                         <el-table-column
                        prop="wordrt2"
                        label="word reading time 2(ms)"
                        width="150">
                        </el-table-column>
                         <el-table-column
                        prop="worda2"
                        label="word accuracy 2"
                        width="150">
                        </el-table-column>
                         <el-table-column
                        prop="questionrt1"
                        label="question reading time(ms)"
                        width="150">
                        </el-table-column>
                         <el-table-column
                        prop="questiona1"
                        label="question accuracy 1"
                        width="150">
                        </el-table-column>
                          <el-table-column
                        prop="questionrt2"
                        label="question reading time 2"
                        width="150">
                        </el-table-column>
                         <el-table-column
                        prop="questiona2"
                        label="question accuracy 2"
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
            questionTable:[],
            results:[]
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

            const resultsres = await this.$http.post(`/rest/responses`,{"userid":this.userid})
            this.results = resultsres.data
            
            for(var x =0;x<this.results.length;x++){
                var wordaccuracy
                var clue
                var questiona1
                var questiona2
                var worda2
                if(this.results[x].wordAccuracy1 == '0'){
                     wordaccuracy = "wrong"
                }
                else{
                     wordaccuracy = "correct"
                }
                if(this.results[x].clueRequired == '0'){
                     clue = "No"
                }
                else{
                     clue = "Yes"
                }
                 if(this.results[x].questionAccuracy1 == '0'){
                     questiona1 = "wrong"
                }
                else{
                     questiona1 = "correct"
                }
                if(this.results[x].questionAccuracy2 == null){
                     questiona2 = "null"
                }
                else if(this.results[x].questionAccuracy2 == '1'){
                     questiona2 = "correct"
                }
                else{
                    questiona2 = "wrong" 
                }
                 if(this.results[x].wordAccuracy2 == null){
                     worda2 = "null"
                }
                else if(this.results[x].wordAccuracy2 == '1'){
                     worda2 = "correct"
                }
                else{
                    worda2 = "wrong" 
                }
                this.questionTable.push({'questionnumber':this.results[x].trailNumber,"sessionnumber":this.results[x].sessionNumber,"readingt":this.results[x].readingDuration,"wordrt1":this.results[x].wordRT1,"wordac1":wordaccuracy,"clue":clue,"wordrt2":this.results[x].wordRT2,"questionrt1":this.results[x].questionRT1,"questiona1":questiona1,"questionrt2":this.results[x].questionRT2,"questiona2":questiona2,'worda2':worda2})
            }
        }
    },
    created(){
         this.fetch()
    }
}
</script>