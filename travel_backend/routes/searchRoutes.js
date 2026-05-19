const express = require("express");
const router = express.Router();

const Tour = require("../models/Tour");
const Guide = require("../models/Guide");

// SEARCH TOURS
router.get("/tours", async (req, res) => {
  try {
    const keyword = req.query.q;

    const tours = await Tour.find({
      title: {
        $regex: keyword,
        $options: "i",
      },
    });

    res.json(tours);
  } catch (error) {
    res.status(500).json({
      message: error.message,
    });
  }
});

// SEARCH GUIDES
router.get("/guides", async (req, res) => {
  try {
    const keyword = req.query.q;

    const guides = await Guide.find({
      location: {
        $regex: keyword,
        $options: "i",
      },
    });

    res.json(guides);
  } catch (error) {
    res.status(500).json({
      message: error.message,
    });
  }
});

module.exports = router;
