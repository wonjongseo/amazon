const express = require("express");
const mongoose = require("mongoose");
const morgan = require("morgan");
const app = express();

const PORT = 4000;
const authRouter = require("./routers/authRouter");

app.use(morgan("dev"));
app.use(express.json());
app.use(authRouter);

const DB = "mongodb://localhost:27017/amazon";

mongoose
  .connect(DB)
  .then(() => console.log("Connect Successful"))
  .catch((e) => console.log(`Connect Fail ${e}`));

app.listen(PORT, () => {
  console.log(`Connect at PORT http://localhost:${PORT}`);
});
