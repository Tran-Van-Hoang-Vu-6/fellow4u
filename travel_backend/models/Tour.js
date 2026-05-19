const mongoose = require("mongoose");

const tourSchema = new mongoose.Schema({
  title: {
    type: String,
    required: true,
  },

  price: {
    type: Number,
    required: true,
  },

  image: {
    type: String,
    required: true,
  },

  duration: {
    type: String,
    default: "3 days",
  },

  likes: {
    type: Number,
    default: 0,
  },

  description: {
    type: String,
    default: "",
  },
});

module.exports = mongoose.model("Tour", tourSchema);
