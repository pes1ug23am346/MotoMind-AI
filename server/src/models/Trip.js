const mongoose = require("mongoose");

const tripSchema = new mongoose.Schema(
  {
    vehicle: { type: mongoose.Schema.Types.ObjectId, ref: "Vehicle", required: true },
    startLocation: { lat: Number, lng: Number, address: String },
    endLocation: { lat: Number, lng: Number, address: String },
    distanceKm: { type: Number, default: 0 },
    durationMin: { type: Number, default: 0 },
    startedAt: { type: Date },
    endedAt: { type: Date },
  },
  { timestamps: true }
);

module.exports = mongoose.model("Trip", tripSchema);
