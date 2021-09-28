const { response } = require("express");
const sql = require("./db.js");
const createNewItem = function (req, res) {
    // Validate request
    if (!req.body) {
        res.status(400).send({
            message: "Content can not be empty!"
        });
        return;
    }
    const NEWI = {
        "name": req.body.Name,
        "style": req.body.style,
        "price": req.body.price,
        "size": req.body.size,
        "brand": req.body.brand,
        "photo": req.body.photo
    };
    sql.query("INSERT INTO item SET ?", NEWI, (err, mysqlres) => {
        if (err) {
            console.log("error: ", err);
            res.status(400).send({ message: "error in creating item: " + err });
            return;
        }
        res.send({ message: "new user created successfully" });
        if (err == ER_DUP_ENTRY) {
            res.status(400).send(alert("Email already exist. Please enter another one"));
        }
        return;
    });
};


const createNewUser = function (req, res) {
// Validate request
    if (!req.body) {
        res.status(400).send({
            message: "Content can not be empty!"
        });
        return;
    }
    const newUser = {
        "firstName": req.body.FirstName,
        "lastName": req.body.LastName,
        "email": req.body.Emailup,
        "pass": req.body.pwdup
    };
    sql.query("INSERT INTO user SET ?", newUser, (err, mysqlres) => {
        if (err) {
            console.log("error: ", err);
            res.status(400).send({message: "error in creating user: " + err});
            return;
        }
        res.send({ message: "new user created successfully" });
        if (err == ER_DUP_ENTRY) {
            res.status(400).send(alert("Email already exist. Please enter another one"));
        }
        return;
    });
};

const createNewContactRequest = function (req, res) {
    // Validate request
    if (!req.body) {
        res.status(400).send({
            message: "Content can not be empty!"
        });
        return;
    }
    const newContactRequest = {
        "FullName": req.body.FullName,
        "Phone": req.body.Phone,
        "Email": req.body.Email,
        "Comment": req.body.Comment
    };
    sql.query("INSERT INTO contactUs SET ?", newContactRequest, (err, mysqlres) => {
        if (err) {
            console.log("error: ", err);
            res.status(400).send({ message: "error in creating Contact Request: " + err });
            return;
        }
        res.send({ message: "new Contact Request created successfully" });
        return;
    });
}

const LogIn = function (request, response) {
    var loginClient = {
        "Emailin": request.body.Emailin,
        "password": request.body.password,
    };

    if (loginClient.Emailin && loginClient.password) {
        sql.query('SELECT * FROM user WHERE Emailin=? AND password = ?', [loginClient.Emailin, loginClient.password], function (err, result) {
            if (err) {
                console.log("error: ", err);
                response.status(400).send({ message: "error in finding user: " + err });
                return;
            }

            else if (result.length > 0) {
                var UserObj = {};

                LoggedInUser = JSON.parse(JSON.stringify(result));
                console.log(LoggedInUser);
                console.log(LoggedInUser[0].email);
                response.render('homepage', { 'LoggedInUser': LoggedInUser });
            } else {
                console.log("user name or password are incurrect");
                response.send(('<script>alert("user name or password are incurrect");window.location.href = "http://localhost:8000/homepage";</script>'));

                return;
            }
            response.end();
        });
    } else {
        console.log("Please enter Username and Password!");
        response.send(('<script>alert("Please enter Username and Password!");window.location.href = "http://localhost:3000/homepage";</script>'));

    }
}



function MessBox_connectIN(email,password) {
    sql.query("SELECT * FROM users where email like ? and password like ?", email + '%' , password + '%', (err, mysqlres) => {
        if (err) {
            console.log("error: ", err);
            return 0;
        }
        console.log("got user by name...");
        return 1;
    });
}

const addedToCart = function (req, res) {
    const newItem = {
        "name": req.body.name,
        "style": req.body.style,
        "price": req.body.price,
        "profile_pic": req.body.profile_pic
    };
    sql.query("Insert into shoppingBag?", newItem, (err, mysqlres) => {
        if (err) {
            console.log("error: ", err);
            res.status(400).send({message: "error in creating item: " + err});
            return;
        }
        res.send({message: "new item created successfully!"});
        return;
    });
    alert("Item added successfully!");
}

function removeItem(req,res) {
    const item = {
        "name": req.body.name,
        "style": req.body.style,
        "price": req.body.price,
        "profile_pic": req.body.profile_pic
    };
        sql.query("Delete from shoppingBag ?", item, (err, mysqlres) => {
            if (err) {
                console.log("error: ", err);
                res.status(400).send({message: "error in creating item: " + err});
                return;
            }
            res.send({message: "new item created successfully!"});
            return;
            alert("Item removed successfully!");
        });
}

function addedTofav(req,res) {
    const item = {
        "name": req.body.name,
        "style": req.body.style,
        "price": req.body.price,
        "profile_pic": req.body.profile_pic
    };
    sql.query("Delete from favorites ?", item, (err, mysqlres) => {
        if (err) {
            console.log("error: ", err);
            res.status(400).send({message: "error in creating item: " + err});
            return;
        }
        
        res.send({message: "new item created successfully!"});
        return;
        alert("Item removed successfully to favorites!");
    });
}

function checkout() {
    alert("Checked out!");
}


module.exports = {
    createNewUser,
    addedToCart,
    removeItem,
    addedTofav,
    checkout,
    MessBox_connectIN,
    createNewContactRequest,
    createNewItem,
    LogIn
}