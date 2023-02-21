const express = require("express");
const Product = require("../models/product");
const auth = require("../middlewares/auth");
const productRouter = express.Router();

productRouter.get("/api/products", async (req, res) => {
  try {
    const products = await Product.find({ category: req.query.category });

    return res.status(200).json(products);
  } catch (e) {
    return res.status(500).json({ error: e.message });
  }
});

productRouter.get("/api/products/search/:name", auth, (req, res) => {});

module.exports = productRouter;
