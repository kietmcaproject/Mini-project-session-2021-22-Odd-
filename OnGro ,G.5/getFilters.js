const Item = require("../database/models/Item");

module.exports = (req, res) => {
  Item.find(
    { $and: [{ available: true }, { totalQuantity: { $gt: 0 } }] },
    (err, data) => {
      brandArray = [];
      categoryArray = [];
      minPrice = parseFloat(data[0].pricePerItem.value);
      console.log(minPrice);
      console.log(typeof minPrice);
      maxPrice = parseFloat(data[0].pricePerItem.value);
      for (i in data) {
        if (categoryArray.indexOf(data[i].tags[0]) == -1) {
          categoryArray.push(data[i].tags[0]);
        }

        if (brandArray.indexOf(data[i].tags[1]) == -1) {
          if (
            data[i].tags[1] == "Unbranded" ||
            data[i].tags[1] == "Unbranded "
          ) {
          } else {
            brandArray.push(data[i].tags[1]);
          }
        }
        currentPrice = parseFloat(data[i].pricePerItem.value);
        console.log(currentPrice);
        console.log(typeof currentPrice);

        if (currentPrice < minPrice) {
          minPrice = currentPrice;
        }
        if (currentPrice > maxPrice) {
          maxPrice = currentPrice;
        }
      }
      console.log(brandArray);
      console.log(categoryArray);
      res.json({
        brand: brandArray,
        category: categoryArray,
        minPrice,
        maxPrice
      });
    }
  );
};
