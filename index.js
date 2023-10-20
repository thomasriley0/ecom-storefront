const express = require("express");
const app = express();
const pgp = require("pg-promise")();
const path = require("path");
const bodyParser = require("body-parser");
const session = require("express-session");

// db config
const dbConfig = {
  host: "db",
  port: 5432,
  database: process.env.POSTGRES_DB,
  user: process.env.POSTGRES_USER,
  password: process.env.POSTGRES_PASSWORD,
};

const db = pgp(dbConfig);

// db test
db.connect()
  .then((obj) => {
    // Can check the server version here (pg-promise v10.1.0+):
    console.log("Database connection successful");
    obj.done(); // success, release the connection;
  })
  .catch((error) => {
    console.log("ERROR:", error.message || error);
  });

// set the view engine to ejs
app.set("view engine", "ejs");
app.use(bodyParser.json());

// set session
app.use(
  session({
    secret: "XASDASDA",
    saveUninitialized: true,
    resave: true,
  })
);

app.use(express.static(__dirname + "/public"));

app.use(
  bodyParser.urlencoded({
    extended: true,
  })
);

app.get("/", (req, res) => {
  const productsQuery =
    "SELECT * FROM product ORDER BY created_at DESC LIMIT 3; ";
  db.any(productsQuery)
    .then((products) => {
      res.render("pages/index", {
        products,
      });
    })
    .catch((err) => {
      res.render("pages/index", {
        products: [],
        error: true,
        message: err.message,
      });
    });
});

app.get("/lighting", (req, res) => {
  const productsQuery = "SELECT * FROM product WHERE category_id = 2;";
  db.any(productsQuery)
    .then((products) => {
      res.render("pages/category", {
        products: products,
        category: "Lighting",
      });
    })
    .catch((err) => {
      res.render("pages/category", {
        products: [],
        category: "Lighting",
        error: true,
        message: err.message,
      });
    });
});

app.get("/lighting/table-lamps", (req, res) => {
  const productsQuery =
    "SELECT * FROM product WHERE category_id = 2 AND subcategory_id = 2;";
  db.any(productsQuery)
    .then((products) => {
      res.render("pages/category", {
        products: products,
        category: "Table Lamps",
      });
    })
    .catch((err) => {
      res.render("pages/category", {
        products: [],
        category: "Table Lamps",
        error: true,
        message: err.message,
      });
    });
});

app.get("/lighting/floor-lamps", (req, res) => {
  const productsQuery =
    "SELECT * FROM product WHERE category_id = 2 AND subcategory_id = 1;";
  db.any(productsQuery)
    .then((products) => {
      res.render("pages/category", {
        products: products,
        category: "Floor Lamps",
      });
    })
    .catch((err) => {
      res.render("pages/category", {
        products: [],
        category: "Floor Lamps",
        error: true,
        message: err.message,
      });
    });
});

app.get("/lighting/light-fixtures", (req, res) => {
  const productsQuery =
    "SELECT * FROM product WHERE category_id = 2 AND subcategory_id = 3;";
  db.any(productsQuery)
    .then((products) => {
      res.render("pages/category", {
        products: products,
        category: "Light Fixtures",
      });
    })
    .catch((err) => {
      res.render("pages/category", {
        products: [],
        category: "Light Fixtures",
        error: true,
        message: err.message,
      });
    });
});

app.get("/product", (req, res) => {
  const productQuery = "SELECT * FROM product WHERE id = $1;";
  db.any(productQuery, [req.query.id])
    .then((product) => {
      res.render("pages/product", { product: product[0] });
    })
    .catch((err) => {
      res.render("pages/product", {
        product: null,
        error: true,
        message: err.message,
      });
    });
});

/*
// Authentication middleware.
const auth = (req, res, next) => {
  if (!req.session.user) {
    return res.redirect("/login");
  }
  next();
};

app.use(auth);

*/

app.listen(3000);
console.log("Server is listening on port 3000");
