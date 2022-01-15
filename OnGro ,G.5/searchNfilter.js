const Item = require("../database/models/Item");

module.exports = (req, res) => {
  search = req.params.search;
  brand = req.params.brand;
  category = req.params.category;
  minPrice = req.params.minPrice;
  maxPrice = req.params.maxPrice;
  if (brand != "All") {
    brandArray = brand.split(",");
    console.log(brandArray);
  }
  if (category != "All") {
    categoryArray = category.split(",");
  }

  if (
    search == "All" &&
    brand == "All" &&
    category == "All" &&
    minPrice == "All" &&
    maxPrice == "All"
  ) {
    Item.find(
      { $and: [{ available: true }, { totalQuantity: { $gt: 0 } }] },
      (err, items) => {
        if (err) {
          res.json({ items: "No Items found" });
        } else {
          res.json({ items });
        }
      }
    );
  } else if (search == "All") {
    Item.find(
      { $and: [{ available: true }, { totalQuantity: { $gt: 0 } }] },
      (err, items) => {
        if (err) {
          res.json({ items: "No Items found" });
        } else {
          if (items.length) {
            //res.json(items)
            //Applying Brand Filter
            if (brand == "All") {
              //pass on
            } else {
              brandArray = brand.split(",");
              brandResults = [];
              for (i in items) {
                if (brandArray.indexOf(items[i].tags[1]) != -1) {
                  brandResults.push(items[i]);
                }
              }
              items = brandResults;
            }

            //Applying Category Filter
            if (category == "All") {
              //pass on
            } else {
              categoryArray = category.split(",");
              categoryResults = [];
              for (i in items) {
                if (categoryArray.indexOf(items[i].tags[0]) != -1) {
                  categoryResults.push(items[i]);
                }
              }
              items = categoryResults;
            }

            //Applying Min Price
            if (minPrice == "All") {
              //pass on
            } else {
              minPriceResults = [];
              for (i in items) {
                currentPrice = parseFloat(items[i].pricePerItem.value);
                if (currentPrice >= minPrice) {
                  minPriceResults.push(items[i]);
                }
              }
              items = minPriceResults;
            }

            //Applying Max Price
            if (maxPrice == "All") {
              //pass on
            } else {
              maxPriceResults = [];
              for (i in items) {
                currentPrice = parseFloat(items[i].pricePerItem.value);
                if (currentPrice <= maxPrice) {
                  maxPriceResults.push(items[i]);
                }
              }
              items = maxPriceResults;
            }

            if (items.length) {
              res.json({ items });
            } else {
              res.json({ items: "No Items found" });
            }
          } else {
            res.json({ items: "No Items found" });
          }
        }
      }
    );
  } else {
    Item.find(
      {
        $and: [{ available: true }, { totalQuantity: { $gt: 0 } }],
        $or: [
          { name: { $regex: search, $options: "i" } },
          { description: { $regex: search, $options: "i" } }
        ]
      },
      (err, items) => {
        if (err) {
          res.json({ items: "No Items found" });
        } else {
          if (items.length) {
            //res.json(items)
            console.log("items");
            console.log(items);

            //Applying Brand Filter
            if (brand == "All") {
              //pass on
            } else {
              brandArray = brand.split(",");
              brandResults = [];
              for (i in items) {
                if (brandArray.indexOf(items[i].tags[1]) != -1) {
                  brandResults.push(items[i]);
                }
              }
              items = brandResults;
            }

            //Applying Category Filter
            if (category == "All") {
              //pass on
            } else {
              categoryArray = category.split(",");
              categoryResults = [];
              for (i in items) {
                if (categoryArray.indexOf(items[i].tags[0]) != -1) {
                  categoryResults.push(items[i]);
                }
              }
              items = categoryResults;
            }

            //Applying Min Price
            if (minPrice == "All") {
              //pass on
            } else {
              minPriceResults = [];
              for (i in items) {
                currentPrice = parseFloat(items[i].pricePerItem.value);
                if (currentPrice >= minPrice) {
                  minPriceResults.push(items[i]);
                }
              }
              items = minPriceResults;
            }

            //Applying Max Price
            if (maxPrice == "All") {
              //pass on
            } else {
              maxPriceResults = [];
              for (i in items) {
                currentPrice = parseFloat(items[i].pricePerItem.value);
                if (currentPrice <= maxPrice) {
                  maxPriceResults.push(items[i]);
                }
              }
              items = maxPriceResults;
            }

            if (items.length) {
              res.json({ items });
            } else {
              res.json({ items: "No Items found" });
            }
          } else {
            res.json({ items: "No Items found" });
          }
        }
      }
    );
  }
};
