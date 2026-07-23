const mongoose = require("mongoose");

const fuelLogSchema = new mongoose.Schema(
  {
    vehicle: { type: mongoose.Schema.Types.ObjectId, ref: "Vehicle", required: true },
    litres: { type: Number, required: true },
    costPerLitre: { type: Number, required: true },
    totalCost: { type: Number, required: true },
    odometerAtFill: { type: Number, required: true },
    date: { type: Date, default: Date.now },
  },
  { timestamps: true }
);

module.exports = mongoose.model("FuelLog", fuelLogSchema);
