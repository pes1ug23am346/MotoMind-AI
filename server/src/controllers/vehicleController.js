const Vehicle = require("../models/Vehicle");

exports.createVehicle = async (req, res) => {
  try {
    const vehicle = await Vehicle.create({ ...req.body, owner: req.userId });
    res.status(201).json(vehicle);
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
};

exports.getMyVehicles = async (req, res) => {
  try {
    const vehicles = await Vehicle.find({ owner: req.userId }).sort({ createdAt: -1 });
    res.json(vehicles);
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
};

exports.getVehicleById = async (req, res) => {
  try {
    const vehicle = await Vehicle.findOne({ _id: req.params.id, owner: req.userId });
    if (!vehicle) return res.status(404).json({ message: "Vehicle not found" });
    res.json(vehicle);
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
};

exports.updateVehicle = async (req, res) => {
  try {
    const vehicle = await Vehicle.findOneAndUpdate(
      { _id: req.params.id, owner: req.userId },
      req.body,
      { new: true, runValidators: true }
    );
    if (!vehicle) return res.status(404).json({ message: "Vehicle not found" });
    res.json(vehicle);
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
};

exports.deleteVehicle = async (req, res) => {
  try {
    const vehicle = await Vehicle.findOneAndDelete({ _id: req.params.id, owner: req.userId });
    if (!vehicle) return res.status(404).json({ message: "Vehicle not found" });
    res.json({ message: "Vehicle deleted" });
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
};
