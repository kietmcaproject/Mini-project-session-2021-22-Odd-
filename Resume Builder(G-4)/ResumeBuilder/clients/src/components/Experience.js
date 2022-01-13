import React, { Component } from 'react';

import axios from 'axios'
class Experience extends Component {

    back = e => {
        e.preventDefault();
        this.props.prevStep();
    };

    continue = e => {
        e.preventDefault();
        this.props.nextStep();
        //              try
        // {

        // var user=JSON.parse(localStorage.getItem("auth_data")).email
        // console.log("user is -=-=-=-=0=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=",user)
        // }
        // catch(e)
        // {
        //     user=""

        // }
        //   var {exp1_org,exp1_pos,exp1_dur,exp1_desc,exp2_org,exp2_pos,exp2_dur,exp2_desc,proj1_title,proj1_link,proj1_desc,proj2_title,proj2_link,proj2_desc} = this.props.values
        // axios.post("/save/education",{user,inst_pos_dur_desc:[`${exp1_org},${exp1_pos},${exp1_dur},${exp1_desc}`,`${exp2_org},${exp2_pos},${exp2_dur},${exp2_desc}`],proj_title_url_desc:[`${proj1_title},${proj1_link},${proj1_desc}`,`${proj2_title},${proj2_link},${proj2_desc}`]}).then(data=>{
        //     console.log("data is ",data)
        // }).catch(err=>{
        //     console.log("error is ",err)
        // })
 
    }

    

    render() {
        const { values, handleChange } = this.props;
        return (
            <div className="card animated fadeInLeft">
                <div className="card-body">

                    <h3 className="card-title">Experience Info</h3>
                    <hr />
                </div>
                <form onSubmit={this.continue}>
                    
                    



                    <div className="row col-lg-10 mx-auto">
                        <div className="col-lg-12 text-left">
                            <h3><b><i className="fas fa-check-circle mr-1"></i>1</b></h3>
                        </div>
                        
                        <div className="col-lg-4 text-left">
                            <label>Institute/Organisation</label>
                            <input type="text" name="exp1_org" className="form-control" defaultValue={values.status === 1 ? '' : values.exp1_org} onChange={handleChange}  />
                        </div>
                        <div className="col-lg-4 text-left">
                            <label>Position</label>
                            <input type="text" name="exp1_pos" className="form-control" defaultValue={values.status === 1 ? '' : values.exp1_pos} onChange={handleChange}  />
                        </div>
                        <div className="col-lg-4 text-left">
                            <label>Duration</label>
                            <input type="text" name="exp1_dur" className="form-control" defaultValue={values.status === 1 ? '' : values.exp1_dur} onChange={handleChange}  />
                        </div>
                    </div>
                    <div className="row col-lg-10 mx-auto">
                        <div className="col-lg-12 text-left">
                            <label>Description</label>
                            <input type="text" name="exp1_desc" className="form-control" defaultValue={values.status === 1 ? '' : values.exp1_desc} onChange={handleChange}  />
                        </div>
                    </div>

                    <br/>

                        

                    <div className="row col-lg-10 mx-auto">
                        <div className="col-lg-12 text-left">
                            <h3><b><i className="fas fa-check-circle mr-1"></i>2</b></h3>
                            <hr/>
                        </div>
                        <div className="col-lg-4 text-left">
                            <label>Institute/Organisation</label>
                            <input type="text" name="exp2_org" className="form-control" defaultValue={values.status === 1 ? '' : values.exp2_org} onChange={handleChange}  />
                        </div>
                        <div className="col-lg-4 text-left">
                            <label>Position</label>
                            <input type="text" name="exp2_pos" className="form-control" defaultValue={values.status === 1 ? '' : values.exp2_pos} onChange={handleChange}  />
                        </div>
                        <div className="col-lg-4 text-left">
                            <label>Duration</label>
                            <input type="text" name="exp2_dur" className="form-control" defaultValue={values.status === 1 ? '' : values.exp2_dur} onChange={handleChange}  />
                        </div>
                    </div>
                    <div className="row col-lg-10 mx-auto">
                        <div className="col-lg-12 text-left">
                            <label>Description</label>
                            <input type="text" name="exp2_desc" className="form-control" defaultValue={values.status === 1 ? '' : values.exp2_desc} onChange={handleChange}  />
                        </div>
                    </div>
                    <br/>
                    <div className="container text-center">
                        <button type="button" className="btn btn-info" onClick={this.back}><i className="fas fa-angle-left mr-1"></i>Back</button>
                        <button type="submit" className="btn btn-info">Next<i className="fas fa-angle-right ml-1"></i></button>
                    </div>
                    <br/>
                </form>
            </div>
        )
    }
}

export default Experience;
