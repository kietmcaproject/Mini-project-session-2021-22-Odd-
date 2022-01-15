const Item = require("../database/models/Item");

module.exports = async (req, res) => {
  const item = await Item.findById(req.params.id);
  tags = item.tags.join(",");
  console.log(tags);
  res.render("updateItem", { item, tags });
};
