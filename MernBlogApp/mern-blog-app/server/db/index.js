const mongoose = require("mongoose");
const uri = "mongodb+srv://jjcoronel104:basictest104@cluster0.0enwhqs.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0";

mongoose.set("strictQuery", false);

mongoose
  .connect(
    uri
  )
  .then(() => console.log("Connected mongo db"))
  .catch((e) => console.log(e));