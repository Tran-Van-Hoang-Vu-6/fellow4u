const express = require("express");
const router = express.Router();

const Guide = require("../models/Guide");

// GET ALL GUIDES
router.get("/", async (req, res) => {
  try {
    const guides = await Guide.find();

    res.json(guides);
  } catch (error) {
    res.status(500).json({
      message: error.message,
    });
  }
});

// CREATE GUIDE
router.post("/", async (req, res) => {
  try {
    const newGuide = new Guide(req.body);

    const savedGuide = await newGuide.save();

    res.status(201).json(savedGuide);
  } catch (error) {
    res.status(500).json({
      message: error.message,
    });
  }
});

module.exports = router;
