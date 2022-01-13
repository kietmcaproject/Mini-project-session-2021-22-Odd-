const express = require('express');
const bodyParser = require('body-parser');
const pdf = require('html-pdf');
const cors = require('cors');
const path = require('path');
const mongoose=require('mongoose');
const pdfTemplate1 = require('./documents');
const template2 = require('./documents/template2.js');

mongoose.connect("mongodb+srv://admin:Maheshwari%401002@kietproject.0xeag.mongodb.net/myFirstDatabase?retryWrites=true&w=majority",{useNewUrlParser: true,useUnifiedTopology: true}).then(()=>console.log("Conencted")).catch(err=>console.log(err));
// const mongoose=require('mongoose');
const { uuid } = require('uuidv4');
const Schema=mongoose.Schema;
const AdminSchema=new Schema({
    name:{
        type:String,
        require:true
    },
        email:{
        type:String,
        require:true
    },
        password:{
        type:String,
        require:true
    },
    token:{
        type:String

    }
});
const User=mongoose.model('ResumeUser',AdminSchema);

const EducationSchema=new Schema({
    userid:{
        type:String,
        require:true
    },
        inst_pos_dur_desc:{
        type:[]
    },
       sch_yr_qual_desc:{
        type:[]
    },
    proj_title_url_desc:{
        type:[]
    }
});
const Education=mongoose.model('Education',EducationSchema);

const PersonalSchema=new Schema({
     userid:{
        type:String

    },
    name:{
        type:String,
        require:true
    },
        email:{
        type:String,
        require:true
    },
        mobile:{
        type:String
    },
    linkedin:{
        type:String

    },
     github:{
        type:String

    },
     skills:{
        type:String

    }
});
const Personal=mongoose.model('Personal',PersonalSchema);

const ExperienceSchema=new Schema({
    userid:{
        type:String,
        require:true
    },
        language:{
        type:String,
        require:true
    },
        hobby:{
        type:String,
        require:true
    },
    achievement:{
        type:[]

    }
});
const Experience=mongoose.model('Experience',ExperienceSchema);
const app = express();

const port = process.env.PORT || 5000;


app.use(cors());
app.use(bodyParser.urlencoded({extended: true}));
app.use(bodyParser.json());

// POST Route - PDF generation and fetching of the data
app.post('/check/login',(req,res)=>{
    var token= req.body.auth_token
    var email= req.body.auth_email
    User.findOne({email,token}).then(exist=>{
        if(exist)
        {
            res.json({success:1})
        }
        else
        {
            console.log("no data ====",exist,token,email)
            res.json({success:0})
        }
    }).catch(err=>{
        console.log("+++++++++++++++++++++++er",err)
        
            res.json({success:0})
        
    })

})
app.post('/save/personal',(req,res)=>{
    var {userid,name,email,mobile,github,linkedin,skills} = req.body
    Personal.findOne({userid}).then(exists=>{
        if(!exists)
        {
                var personal = new Personal({
        userid,
        name,
        email,
        mobile,
        github,
        linkedin,
        skills
    })
    personal.save().then(saved=>{
        res.json({success:1,saved})
    }).catch(err=>{
        res.json({success:0})
    })
        }
        else
        {
            res.json({success:0,message:"user already exists"})
        }

    })

})
app.post('/save/education',(req,res)=>{
    var {user,inst_pos_dur_desc, sch_yr_qual_desc,proj_title_url_desc} = req.body
    console.log(user,inst_pos_dur_desc,proj_title_url_desc,"}{}{}{}{}{}{}{}}{}{}{}{}}}{} user is",user)
    Education.findOne({userid:user}).then(exist=>{
        if(!exist)
        {
                var education = new Education({
       userid:user,
       inst_pos_dur_desc,
       proj_title_url_desc,
       sch_yr_qual_desc
    })
    education.save().then(saved=>{
        res.json({success:1,saved})
    }).catch(err=>{
        res.json({success:0})
    })
        }
        else
        {
            res.json({success:0})
        }
    })

})
app.post('/save/experience',(req,res)=>{
    var {user,language,hobby,achievement} = req.body
    var personal = new Experience({
        userid:user,
        language,
        hobby,
        achievement
    })
    personal.save().then(saved=>{
        res.json({success:1,saved})
    }).catch(err=>{
        res.json({success:0})
    })
})

app.post('/login',(req,res)=>{
    var {email,password}=req.body

    User.findOne({email,password}).then(exist=>{
        if(exist)
        {
            var tok=uuid()
            exist.token=tok
            exist.save()
            res.json({success:1,user:exist,token:tok})
        }
        else
        {
            res.json({success:0})
        }
    }).catch(err=>{
        
            res.json({success:0})
        
    })
})


app.post('/signup',(req,res)=>{
     var {name,email,password}=req.body
        User.findOne({email}).then(exist=>{
        if(exist)
        {
            res.json({success:0,message:"user already exists"})
        }
        else
        {
                 var user= new User({
        name,
        email,
        password
     })

     user.save().then(saved=>{
        if(saved)
        {
            res.json({success:1,message:"user saved successfully"})
        }
        else
        {
             res.json({success:0,message:"error in saving user"})
        }
     }).catch(err=>{
        res.json({success:0,message:"error in saving user"})
     })
        }
    }).catch(err=>{
        
            res.json({success:0})
        
    })

})
app.post('/create-pdf', (req, res) => {
    if(req.body.format == "1")
    {
            pdf.create(pdfTemplate1(req.body), {}).toFile('Resume.pdf', (err) => {
        if(err){
            res.send(Promise.reject());
            console.log(err);
        }

        res.send(Promise.resolve());
        console.log('Success');
    });
    }
    else
    {

    pdf.create(template2(req.body), {}).toFile('Resume.pdf', (err) => {
        if(err){
            res.send(Promise.reject());
            console.log(err);
        }

        res.send(Promise.resolve());
        console.log('Success');
    });
    }
});


// Get - Send generated pdf to the client
app.get('/fetch-pdf', (req,res) => {
    res.sendFile(`${__dirname}/Resume.pdf`);
});

// Serve static assets if in production
if(process.env.NODE_ENV === 'production'){
    //set static folder
    app.use(express.static('client/build'));

    app.get('*', (req, res) => {
        res.sendFile(path.resolve(__dirname, 'client', 'build', 'index.html'));
    });
}


app.listen(port, () => console.log(`Server started on port ${port}`));