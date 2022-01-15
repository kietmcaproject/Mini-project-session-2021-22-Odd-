const path = require("path");
const Item = require("../database/models/Item");
module.exports = async (req, res) => {
  Item.remove({ _id: req.params.id }, (error, item) => {
    console.log(error);
    res.redirect("/");
  });
};
