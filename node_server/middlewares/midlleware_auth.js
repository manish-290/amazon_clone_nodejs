import jwt from "jsonwebtoken";

const auth = async (req,res,next)=>{
    try{
        const token = req.header('x-auth-token');
        if(!token){
            return res.status(401).json({message:"The token is null. Access denied."})
        }

        const isVerified = jwt.verify(token,'passwordKey');
        if(!isVerified){
            return res.status(401).json({message:"Token verification failed: Authorization denied!"});

        }
        //adding the user to the request object
         req.user = isVerified.id;
         req.token = token;

        next();
    }catch(e){
        res.status(500).json({error:e.message});
    }
}

export default auth;