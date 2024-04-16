import express from "express";
const adminRouter = express.Router();
import admin from "../middlewares/admin_middleware.js"
import Product from "../models/products.js";

//create an admin middlewares
//verify the user either they are user or admin through their id

adminRouter.post('/admin/addProduct',admin,async (req,res)=>{
    
    try{
        const { name, price, category, quantity, images, description}= req.body;
        //initialize the product
        let product = new Product({
            name,
            description,
            category,
            price,
            quantity,
            images,
        });
        //store the product to mongodb
        product = await product.save();
        res.json(product);

    }catch(e){
        return res.status(500).json({error:e});
    }
});
export default adminRouter;