const express = require("express");
const { Product } = require("../models/product");
const adminRouter = express.Router();

adminRouter.post("admin/producst", auth, async (req, res) => {
  try {
    const { name, description, images, quantity, price, category } = req.body;
    let product = new Product({
      name,
      description,
      images,
      quantity,
      price,
      category,
    });
    product = await product.save();

    return res.json(product);
  } catch (e) {
    return res.status(500).json({ erorr: e.message });
  }
});

adminRouter.get("/admin/producst", auth, async (req, res) => {
  try {
    const products = await Product.find({});

    return res.json(products);
  } catch (e) {
    return res.status(500).json({ error: e.message });
  }
});

module.exports = adminRouter;
