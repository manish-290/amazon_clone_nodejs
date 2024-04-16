//packages import
import express from "express";
import mongoose from "mongoose";

//import from other files
import authRouter from "./routes/auth.js";
import adminRouter from "./routes/admin.js";

//initialization
const PORT = 3000;
const Db = "mongodb+srv://manishpaudel280:manish280@amazoncluster0.q2p66en.mongodb.net/?retryWrites=true&w=majority&appName=AmazonCluster0";
const app =  express();

//use middlewares
app.use(express.json());
app.use(authRouter);
app.use(adminRouter);

//connections
//connect to mongodb database and it is a promise or future
mongoose.connect(Db)
.then(()=>{
    console.log("Connection successful");
}).catch((e)=>{
    console.log(e)
});


app.listen(PORT,"0.0.0.0",()=>{
    console.log(`server is running on the port ${PORT}` );
})

//notes
//lets create an api
// we only want to run the index.js file,
// that triggers whole code