const mongoose = require("mongoose");

const paymentSchema = new mongoose.Schema({
  userName: {
    type: String,
    required: true,
  },

  amount: {
    type: Number,
    required: true,
  },

  paymentMethod: {
    type: String,
    required: true,
  },

  transactionId: {
    type: String,
    required: true,
  },

  paymentStatus: {
    type: String,
    default: "Completed",
  },

  paymentDate: {
    type: String,
    required: true,
  },
});

module.exports = mongoose.model("Payment", paymentSchema);
