const path = require("path");
const Item = require("../database/models/Item");
module.exports = async (req, res) => {
  const { image } = req.files;
  image.mv(path.resolve(__dirname, "..", "public/items", image.name), error => {
    stringOfTags = req.body.tags;
    arrayOfTags = stringOfTags.split(",");
    Item.create(
      {
        ...req.body,
        available: req.body.available ? true : false,
        tags: arrayOfTags,
        imagePath: `/items/${image.name}`
      },
      (error, item) => {
        console.log(error);
        res.redirect("/");
      }
    );
  });
};
