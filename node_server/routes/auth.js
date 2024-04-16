import express from "express";
import bcryptjs from "bcryptjs";
import User from "../models/user.js";
import jwt from "jsonwebtoken";
import auth from "../middlewares/midlleware_auth.js";

//create a router
const authRouter = express.Router();

//post request for  registering new user
authRouter.post("/api/signup", async (req, res) => {
  try {
    //get the dat from the client
    const { name, email, password } = req.body;

    const existingUser = await User.findOne({ email });
    if (existingUser) {
      res.status(400).json({ message: "Email is already in use. " });
    }
    //hash the password
    const hashedPassword = await bcryptjs.hash(password, 10);
    //create a User
    let user = new User({
      name,
      email,
      password: hashedPassword,
    });
    //post the data in a database
    user = await user.save();
    //return that data to the user
    res.json(user);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

//rest api fror post request login
authRouter.post("/api/login", async (req, res) => {
  try {
    const { email, password } = req.body;
    const user = await User.findOne({ email });
    //check if user email exist
    if (!user) {
      return res.status(400).json({ message: "User not found!" });
    }

    //check for password
    const isMatched = await bcryptjs.compare(password, user.password);
    if (!isMatched) {
      return res.status(400).json({ message: "Invalid password" });
    }
    //lets success using json web token
    const token = jwt.sign({ id: user._id }, "passwordKey");
    //send this token to client
    res.json({ token, ...user._doc });
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

//get the user data after verification
authRouter.post("/isValidToken", async (req, res) => {
  try {
    const token = req.header("x-auth-token");
    if (!token) return res.json(false);

    //verify token
    const isVerified = jwt.verify(token, "passwordKey");
    if (!isVerified) return res.json(false);

    //is user available or not despite token being verified
    const user = await User.findById(isVerified.id);
    if(!user) return res.json(false);
    
    //return true if everything is fine
     res.json(true);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

//get the user data 
authRouter.get('/',auth, async(req,res)=>{
  const user = await User.findById(req.user);
  res.json({...user._doc, token:req.token})
});

export default authRouter;
