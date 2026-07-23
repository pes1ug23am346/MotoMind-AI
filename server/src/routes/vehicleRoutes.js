const express = require("express");
const router = express.Router();
const auth = require("../middleware/auth");
const {
  createVehicle,
  getMyVehicles,
  getVehicleById,
  updateVehicle,
  deleteVehicle,
} = require("../controllers/vehicleController");

router.use(auth); // all routes below require a valid JWT

router.post("/", createVehicle);
router.get("/", getMyVehicles);
router.get("/:id", getVehicleById);
router.put("/:id", updateVehicle);
router.delete("/:id", deleteVehicle);

module.exports = router;
