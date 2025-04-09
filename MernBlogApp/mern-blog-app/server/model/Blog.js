const moongoose = require("moongoose");

const Schema = moongoose.Schema;

const blogSchema = new Schema({
  title: {
    typeof: String,
  },
  description: {
    typeof: String,
  },
  date: {
    typeof: Date,
    default: Date.now,
  },
});

module.exports = moongoose.model("Blog", blogSchema);
