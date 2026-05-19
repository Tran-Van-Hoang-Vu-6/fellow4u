const mongoose = require("mongoose");

const newsSchema = new mongoose.Schema({
  title: {
    type: String,
    required: true,
  },

  date: {
    type: String,
    required: true,
  },

  image: {
    type: String,
    required: true,
  },

  content: {
    type: String,
    default: "",
  },
});

module.exports = mongoose.model("News", newsSchema);
