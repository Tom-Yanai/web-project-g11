const express = require('express')
const app = express()
const port = 8080
const path = require('path');


app.get('/', (req, res) => {
    res.send('Hello World!')
})
app.listen(port, () => {
    console.log(`Example app listening at http://localhost:${port}`)
})

app.use(express.static('css'));

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
    res.sendFile(path.join(__dirname, '/html/homepage.html'));
});