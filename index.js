const express = require("express");
const app = express();
const pgp = require("pg-promise")();
const path = require("path");
const bodyParser = require("body-parser");
const session = require("express-session");
var router = express.Router();
const bcrypt = require("bcryptjs");

// db config
const dbConfig = {
  host: "db",
  port: 5432,
  database: process.env.POSTGRES_DB,
  user: process.env.POSTGRES_USER,
  password: process.env.POSTGRES_PASSWORD,
};

var user = {
  user_id: undefined,
  username: undefined,
  email: undefined,
  first_name: undefined,
  last_name: undefined,
  mobile: undefined,
  created_at: undefined,
  modified_at: undefined,
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
        products: products,
        user: user,
      });
    })
    .catch((err) => {
      res.render("pages/index", {
        products: [],
        user: user,
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
        user: user,
        category: "Lighting",
      });
    })
    .catch((err) => {
      res.render("pages/category", {
        products: [],
        user: user,
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
        user: user,
        category: "Table Lamps",
      });
    })
    .catch((err) => {
      res.render("pages/category", {
        products: [],
        user: user,
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
        user: user,
        category: "Floor Lamps",
      });
    })
    .catch((err) => {
      res.render("pages/category", {
        products: [],
        user: user,
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
        user: user,
        category: "Light Fixtures",
      });
    })
    .catch((err) => {
      res.render("pages/category", {
        products: [],
        user: user,
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
      res.render("pages/product", { product: product[0], user: user });
    })
    .catch((err) => {
      res.render("pages/product", {
        product: null,
        user: user,
        error: true,
        message: err.message,
      });
    });
});

app.get("/login", (req, res) => {
  res.render("pages/login", { user: user });
});

// Login submission
app.post("/login", (req, res) => {
  const email = req.body.email;
  const query = "select * from users where email = $1";
  const values = [email];

  db.one(query, values)
    .then((data) => {
      bcrypt.compare(req.body.password, data.password, function (err, result) {
        console.log("Login: " + result);
        if (err) return cb(err);
        cb(result, data, req, res);
      });
    })
    .catch((err) => {
      console.log(err);
      res.redirect("/login");
    });
});

function cb(result, data, req, res) {
  if (result) {
    user.user_id = data.id;
    user.username = data.username;
    user.email = data.email;
    user.first_name = data.first_name;
    user.last_name = data.last_name;
    user.mobile = data.mobile;
    user.created_at = data.created_at;
    user.modified_at = data.modified_at;

    req.session.user = user;
    req.session.save();
    res.redirect("/");
  } else {
    res.redirect("/login");
  }
}

app.get("/logout", (req, res) => {
  req.session.destroy();
  user = {};
  res.render("pages/login", { user: user });
});

// Authentication middleware.
const auth = (req, res, next) => {
  if (!req.session.user) {
    return res.redirect("/login");
  }
  next();
};

app.use(auth);

app.get("/cart", (req, res) => {
  const getCart =
    "SELECT * FROM cart_item INNER JOIN shopping_session on cart_item.session_id = shopping_session.id JOIN product on product.id = cart_item.product_id WHERE user_id = $1;";
  db.any(getCart, [user.user_id])
    .then((cartDetails) => {
      console.log(cartDetails);
      res.render("pages/cart", {
        cartDetails: cartDetails,
        itemCount: Object.keys(cartDetails).length,
        user: user,
      });
    })
    .catch((err) => {
      console.log(err);
      res.render("pages/cart", { cartDetails: [], user: user });
    });
});

app.get("/profile", (req, res) => {
  res.render("pages/profile", { user: user });
});

app.get("/orders", (req, res) => {
  const getOrders = "SELECT * FROM order_details WHERE user_id = $1;";
  db.any(getOrders, [user.user_id])
    .then((orderDetails) => {
      console.log(orderDetails);
      res.render("pages/orders", {
        orderDetails: orderDetails,
        orderCount: Object.keys(orderDetails).length,
        user: user,
      });
    })
    .catch((err) => {
      console.log(err);
      res.render("pages/orders", {
        orderDetails: [],
        orderCount: 0,
        user: user,
      });
    });
});

app.get("/order", (req, res) => {
  const getOrderInfo =
    "SELECT * FROM order_items JOIN order_details ON order_items.order_id = order_details.id JOIN product ON order_items.product_id = product.id WHERE order_items.id = $1;";
  db.any(getOrderInfo, [req.query.id])
    .then((order) => {
      if (user.user_id == order[0].user_id) {
        res.render("pages/order", {
          orderDetails: order[0],
          user: user,
        });
      } else {
        res.render("pages/404", {
          user: user,
        });
      }
    })
    .catch((err) => {
      console.log(err);
      res.render("pages/order", {
        user: user,
      });
    });
});

app.post("/checkout", (req, res) => {
  const getCart =
    "SELECT * FROM cart_item INNER JOIN shopping_session on cart_item.session_id = shopping_session.id JOIN product on product.id = cart_item.product_id WHERE user_id = $1;";

  db.any(getCart, [user.user_id])
    .then((cartDetails) => {
      console.log(cartDetails);
      if (user.user_id == cartDetails[0].user_id) {
        res.render("pages/checkout", {
          cartDetails: cartDetails,
          itemCount: Object.keys(cartDetails).length,
          user: user,
        });
      } else {
        res.render("pages/404", {
          user: user,
        });
      }
    })
    .catch((err) => {
      console.log(err);
      res.render("pages/404", { user: user });
    });
});

app.listen(3000);
console.log("Server is listening on port 3000");
