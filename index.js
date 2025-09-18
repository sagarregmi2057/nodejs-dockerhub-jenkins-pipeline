const express = require('express');
const app = express();
const port = 3000;

app.get('/', (req, res) => {
    res.send('nodejs app running in the kubernetes cluster sagarregmi2056@gmail.com');
});

app.listen(port, () => {
    console.log(`Server is running on port ${port}`);
});
