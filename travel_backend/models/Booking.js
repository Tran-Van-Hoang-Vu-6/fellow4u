const mongoose = require("mongoose");

const bookingSchema = new mongoose.Schema({
  userName: {
    type: String,
    required: true,
  },

  tourName: {
    type: String,
    required: true,
  },

  people: {
    type: Number,
    required: true,
  },

  bookingDate: {
    type: String,
    required: true,
  },

  totalPrice: {
    type: Number,
    required: true,
  },

  status: {
    type: String,
    default: "Pending",
  },
});

module.exports = mongoose.model("Booking", bookingSchema);
