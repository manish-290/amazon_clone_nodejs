import jwt from 'jsonwebtoken';
import User from "../models/user.js"

const admin = async(req,res,next)=>{
    try{
        const token = req.header('x-auth-token');
        if(!token){
            return res.status(401).json({message:"No auth token, access denied"});
        }
        const verified = jwt.verify(token,"passwordKey");
        if(!verified){
            return res.status(401).json({message:"Token verification failed"});

        }
        const user = User.findById(verified.id);
        if(user.type == "user" || user.type == "seller"){
            return res.status(401).json({message:"You are not an admin"});
        }
        req.user = verified.id;
        req.token = token;
    }catch(e){
        return res.status(500).json({error:e.message});
    }
}

export default admin;