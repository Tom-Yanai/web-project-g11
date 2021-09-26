const express = require('express');
const app = express();
const port = 8000;
const path = require('path');
const bodyParser = require("body-parser");
const CRUD_operations = require("./CRUD_functions.js");

app.use(express.static((path.join(__dirname, '/'))));
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));


app.get('/', (req, res) => {
    res.sendFile(path.join(__dirname, '/html/homepage.html'));
});

app.get('/stores', (req, res)=> {
    res.sendFile(path.join(__dirname, '/html/stores.html'));
});

app.get('/homepage', (req, res) => {
    res.sendFile(path.join(__dirname, '/html/homepage.html'));
});

app.get('/about', (req, res) => {
    res.sendFile(path.join(__dirname, '/html/about.html'));
});

app.get('/addItemPage', (req, res) => {
    res.sendFile(path.join(__dirname, '/html/addItemPage.html'));
});

app.get('/community', (req, res) => {
    res.sendFile(path.join(__dirname, '/html/community.html'));
});

app.get('/communityPage', (req, res) => {
    res.sendFile(path.join(__dirname, '/html/communityPage.html'));
});

app.get('/contact', (req, res) => {
    res.sendFile(path.join(__dirname, '/html/contact.html'));
});

app.get('/contactUs', (req, res) => {
    res.sendFile(path.join(__dirname, '/html/contactUs.html'));
});

app.get('/favorites', (req, res) => {
    res.sendFile(path.join(__dirname, '/html/favorites.html'));
});

app.get('/myprofile', (req, res) => {
    res.sendFile(path.join(__dirname, '/html/myprofile.html'));
});

app.get('/payment', (req, res) => {
    res.sendFile(path.join(__dirname, '/html/payment.html'));
});

app.get('/shoppingbag', (req, res) => {
    res.sendFile(path.join(__dirname, '/html/shoppingbag.html'));
});

app.get('/storeBrenda', (req, res) => {
    res.sendFile(path.join(__dirname, '/html/storeBrenda.html'));
});

app.post("/newUser", CRUD_operations.createNewUser);
app.post("/removeItem", CRUD_operations.removeItem);
app.post("/addToCart", CRUD_operations.addedToCart);
app.post("/addTofav", CRUD_operations.addedTofav);
app.post("/checkout", CRUD_operations.checkout);

app.listen(port, () => {
    console.log(`app is listening at http://localhost:${port}`)
});