const Item = require("../database/models/Item");

module.exports = async (req, res) => {
  const item = await Item.findById(req.params.id);
  res.render("item", { item });
};
