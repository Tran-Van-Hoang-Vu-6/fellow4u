const express = require("express");
const router = express.Router();

const News = require("../models/News");

// GET ALL NEWS
router.get("/", async (req, res) => {
  try {
    const news = await News.find();

    res.json(news);
  } catch (error) {
    res.status(500).json({
      message: error.message,
    });
  }
});

// CREATE NEWS
router.post("/", async (req, res) => {
  try {
    const newNews = new News(req.body);

    const savedNews = await newNews.save();

    res.status(201).json(savedNews);
  } catch (error) {
    res.status(500).json({
      message: error.message,
    });
  }
});

module.exports = router;
