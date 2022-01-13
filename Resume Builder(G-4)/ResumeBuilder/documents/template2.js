module.exports = function template2({
    name,
    email,
    phone,
    linkedin,
    github,
    skills,
    exp1_org,
    exp1_pos,
    exp1_desc,
    exp1_dur,
    exp2_org,
    exp2_pos,
    exp2_desc,
    exp2_dur,
    proj1_title,
    proj1_link,
    proj1_desc,
    proj2_title,
    proj2_link,
    proj2_desc,
    edu1_school,
    edu1_year,
    edu1_qualification,
    edu1_desc,
    edu2_school,
    edu2_year,
    edu2_qualification,
    edu2_desc,
    extra_1,
    extra_2,
    extra_3,
    extra_4,
    extra_5
}){
    return `
    <!doctype html>
    <html>  
        <head>
            <!-- Font Awesome -->
            <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css">
            <!-- Bootstrap core CSS -->
            <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
            <!-- Material Design Bootstrap -->
            <link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.7.5/css/mdb.min.css" rel="stylesheet">
            
            <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Moon+Dance&display=swap" rel="stylesheet">

            <style>
              html{
                  zoom: 0.55;
                   background-color: #fff;
                   min-height:100vh!important;
                  
              }   
            
              .rule{
                border-bottom: 1px solid black;
                width:80%;
              }
              .mobile{
                margin-top:-10px;
              }
              .email{
                margin-bottom: 0;    
              }
              body{
              font-family: 'Playfair Display', serif;
                background-color: #fff;
                font-weight:bold;
                min-height:100vh!important;
               
              }
            </style>
        
        </head>
        <body>

        <div class="col-lg-8 mx-auto">
        <br/><br/> 
        <div class="row text-left">
            <div class="col-lg-6">
                <h1><b>${name}</b></h1>
              

                <p class="lead email"><strong><i class="fas fa-envelope"></i></strong> ${email}</p>
                <p class="lead"><strong><i class="fas fa-phone"></i></strong> (+91)${phone}</p>
                
            </div>    
        </div>
      
        <hr/>
        <div class="col-lg-8 mx-auto bg-light">
              <h3><b><i class="fas fa-pencil-alt"></i> Skills</b></h3>
        </div>
       

        <div class="col-lg-8 row mx-auto">
            <p class="lead"> ${skills}</p>
        </div>

        <br/>
        <br/>
        <div class="col-lg-8 mx-auto bg-light">
              <h3><b><i class="fas fa-suitcase"></i> Experience</b></h3>
        </div>
        <div class="col-lg-8 mx-auto">
              <p class="lead"><b>${exp1_org}, ${exp1_pos}</b> (${exp1_dur})</p>
              <p class="mt-0">${exp1_desc}</p>
        </div>
        <div class="col-lg-8 mx-auto">
              <p class="lead"><b>${exp2_org}, ${exp2_pos}</b> (${exp2_dur})</p>
              <p class="mt-0">${exp2_desc}</p>
        </div>

         <br/>
        <br/>
        <div class="col-lg-8 mx-auto bg-light">
              <h3><b><i class="fas fa-rocket"></i> Projects</b></h3>
        </div>
        <div class="col-lg-8 mx-auto">
              <p class="lead"><b>${proj1_title}</b>(${proj1_link})</p>
              <p class="mt-0">${proj1_desc}</p>
        </div>
        <div class="col-lg-8 mx-auto">
              <p class="lead"><b>${proj2_title}</b> (${proj2_link})</p>
              <p class="mt-0">${proj2_desc}</p>
        </div>

 <br/>
        <br/>
        <div class="col-lg-8 mx-auto bg-light">
              <h3><b><i class="fas fa-user-graduate"></i> Education</b></h3>
        </div>
        <div class="col-lg-8 mx-auto">
              <p class="lead"><b>${edu1_school}</b> (${edu1_qualification}, ${edu1_year})</p>
              <p class="mt-0">${edu1_desc}</p>
        </div>
        <div class="col-lg-8 mx-auto">
              <p class="lead"><b>${edu2_school}</b> (${edu2_qualification}, ${edu2_year})</p>
              <p class="mt-0">${edu2_desc}</p>
        </div>
 <br/>
        <br/>
        <div class="col-lg-8 mx-auto bg-light">
              <h3><b><i class="fas fa-star"></i> Extra-Curriculars/Activities</b></h3>
        </div>
        <div class="col-lg-8 mx-auto">
              <ul>
                <li><p class="lead"><b>Languages: </b>${extra_1} </p></li>
                <li><p class="lead"><b>Hobbies: </b>${extra_2} </p></li>
                <li><p class="lead">${extra_3} </p></li>
                <li><p class="lead">${extra_4} </p></li>
                <li><p class="lead">${extra_5} </p></li>
              </ul>
              
        </div>
        <br/>
        <br/>

        <footer class="w-100 d-inline-flex justify-content-around">
        <span class="lead"><strong><i class="fab fa-linkedin"></i>:</strong> ${linkedin}</span>
                <span class="lead"><strong><i class="fab fa-github"></i>:</strong> ${github}</span>
        </footer>
        
            <!-- JQuery -->
            <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
            <!-- Bootstrap tooltips -->
            <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.4/umd/popper.min.js"></script>
            <!-- Bootstrap core JavaScript -->
            <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
            <!-- MDB core JavaScript -->
            <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.7.5/js/mdb.min.js"></script>
        </body>
    </html> 
  `;
}