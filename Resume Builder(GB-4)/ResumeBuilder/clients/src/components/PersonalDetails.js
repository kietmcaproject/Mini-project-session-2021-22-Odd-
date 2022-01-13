import React, { Component } from 'react'
import axios from 'axios'
class PersonalDetails extends Component {
    state:{
        show_name:''
    }

    componentDidMount()
    {
          try
        {

        // var user=JSON.parse(localStorage.getItem("auth_data")).email
        var show_name=JSON.parse(localStorage.getItem("auth_data")).name
        console.log("show name is ",show_name)
        this.setState({show_name:show_name},()=>{
            console.log("show name updated")

        })

        }
        catch(e)
        {
            // user=""

        } 
    }

    continue = e => {
        e.preventDefault();
        this.props.nextStep();

        console.log("this prosp..........",this.props)
        var {name,email,phone,github,linkedin,skills} = this.props.values
        try
        {

        var user=JSON.parse(localStorage.getItem("auth_data")).email
        var show_name=JSON.parse(localStorage.getItem("auth_data")).name
        console.log("show name is ",show_name)
        this.setState({show_name})

        }
        catch(e)
        {
            user=""

        }
        axios.post("/save/personal",{userid:user,name,email,mobile:phone,github,linkedin,skills}).then(data=>{
            console.log("data is ",data)
        }).catch(err=>{
            console.log("error is ",err)
        })
    };
     
     // savePersonal= ()=>{
     //    console.log(this.props.values)
     // }
    

      
    render() {
        const { values, handleChange } = this.props;
        return (
            <div className="card animated fadeInLeft">
                <div className="card-body">
                

                    <h3 className="card-title">Personal Info</h3>
                    <hr />
                </div>
                <form onSubmit={this.continue}>
                    <div className="row col-lg-10 mx-auto">
                        <div className="col-lg-4 text-left">
                            <label>Name*</label>
                            <input type="text" name="name" className="form-control" onChange={handleChange} defaultValue={values.status === 1 ? '' : values.name} required />
                        </div>
                        <div className="col-lg-4 text-left">
                            <label>Email*</label>
                            <input type="email" name="email" className="form-control" onChange={handleChange}  defaultValue={values.status === 1 ? '' : values.email} required />
                        </div>
                        <div className="col-lg-4 text-left">
                            <label>Mobile*</label>
                            <input type="text" name="phone" className="form-control" onChange={handleChange} defaultValue={values.status === 1 ? '' : values.phone} required />
                        </div>
                    </div>
                    <br />
                    <div className="row col-lg-10 mx-auto">
                        <div className="col-lg-6 text-left">
                            <label>Linkedin</label>
                            <input type="text" name="linkedin" className="form-control" defaultValue={values.status === 1 ? '' : values.linkedin} onChange={handleChange} />
                        </div>
                        <div className="col-lg-6 text-left">
                            <label>Github</label>
                            <input type="text" name="github" className="form-control" defaultValue={values.status === 1 ? '' : values.github} onChange={handleChange} />
                        </div>
                    </div>
                    <br />
                    <div className="row col-lg-10 mx-auto">
                        <div className="col-lg-12 text-left">
                            <label>Skills* (Separate each skill with a space and a comma)</label>
                            <input type="text" name="skills" className="form-control"  defaultValue={values.status === 1 ? '' : values.skills} onChange={handleChange} />
                        </div>
                    </div>
                    <br />
                    <div className="container text-center"><button type="submit" className="btn btn-info" onClick={this.savePersonal}>Next<i className="fas fa-angle-right ml-1"></i></button></div>
                    <br/>
                </form>
            
            </div>
        )
    }
}


export default PersonalDetails;
