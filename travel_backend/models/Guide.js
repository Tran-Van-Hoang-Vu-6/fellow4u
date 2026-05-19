const mongoose = require("mongoose");

const guideSchema = new mongoose.Schema({
  name: {
    type: String,
    required: true,
  },

  location: {
    type: String,
    required: true,
  },

  image: {
    type: String,
    required: true,
  },

  rating: {
    type: Number,
    default: 5,
  },

  reviews: {
    type: Number,
    default: 0,
  },

  description: {
    type: String,
    default: "",
  },
});

module.exports = mongoose.model("Guide", guideSchema);
