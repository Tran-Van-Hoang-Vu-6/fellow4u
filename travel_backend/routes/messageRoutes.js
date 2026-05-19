const express = require("express");
const router = express.Router();

const Message = require("../models/Message");

// GET ALL MESSAGES
router.get("/", async (req, res) => {
  try {
    const messages = await Message.find();

    res.json(messages);
  } catch (error) {
    res.status(500).json({
      message: error.message,
    });
  }
});

// SEND MESSAGE
router.post("/", async (req, res) => {
  try {
    const newMessage = new Message(req.body);

    const savedMessage = await newMessage.save();

    res.status(201).json(savedMessage);
  } catch (error) {
    res.status(500).json({
      message: error.message,
    });
  }
});

module.exports = router;
