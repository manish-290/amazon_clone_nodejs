import mongoose from "mongoose";

const userSchema = mongoose.Schema({
    name:{type:String,
         required:true,
         //clean the unnecessary spaces
         trim:true
        },
        email:{
            required:true,
            type:String,
            unique:true,
            trim:true,
            validate:{
                validator:(val)=>{
                    const regEx = /^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
                    return val.match(regEx);
                },
                message: "please enter the valid email address",
            }
        },
        password:{
            required:true,
            trim:true,
            type:String,
            validate:{
                validator:(val)=>{
                    return val.length > 6;
                },
                message: "please enter the password more than 6 characters",
            }
        },
        address:{
            type:String,
            default:""
        },
        type:{
            type:String,
            default:"user"
        }
       
});

//the above is the structure of user, now create a model
const User = mongoose.model("User",userSchema);

export default User;