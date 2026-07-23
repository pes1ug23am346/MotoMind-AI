const mongoose = require("mongoose");

const serviceLogSchema = new mongoose.Schema(
  {
    vehicle: { type: mongoose.Schema.Types.ObjectId, ref: "Vehicle", required: true },
    serviceType: { type: String, required: true },
    description: { type: String },
    cost: { type: Number, default: 0 },
    odometerAtService: { type: Number },
    serviceDate: { type: Date, default: Date.now },
    nextDueDate: { type: Date },
  },
  { timestamps: true }
);

module.exports = mongoose.model("ServiceLog", serviceLogSchema);
