const path = require("path");
const Item = require("../database/models/Item");
module.exports = async (req, res) => {
  if (req.files) {
    console.log("Image Changed");
    const { image } = req.files;
    image.mv(
      path.resolve(__dirname, "..", "public/items", image.name),
      error => {
        stringOfTags = req.body.tags;
        arrayOfTags = stringOfTags.split(",");
        Item.update(
          { _id: req.body._id },
          {
            available: req.body.available ? true : false,
            name: req.body.name,
            description: req.body.description,
            totalQuantity: req.body.totalQuantity,
            pricePerItem: req.body.pricePerItem,
            tags: arrayOfTags,
            imagePath: `/items/${image.name}`
          },
          (error, item) => {
            console.log(error);
            res.redirect("/");
          }
        );
      }
    );
  } else {
    console.log("Image not changed");
    stringOfTags = req.body.tags;
    arrayOfTags = stringOfTags.split(",");
    Item.update(
      { _id: req.body._id },
      {
        available: req.body.available ? true : false,
        name: req.body.name,
        description: req.body.description,
        totalQuantity: req.body.totalQuantity,
        pricePerItem: req.body.pricePerItem,
        tags: arrayOfTags
      },
      (error, item) => {
        console.log(error);
        res.redirect("/");
      }
    );
  }
};
