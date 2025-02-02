
const express = require('express');
const bodyParser = require('body-parser');

const app = express();
const port = process.env.PORT || 3000;

// Middleware to parse JSON bodies
app.use(bodyParser.json());

// API endpoint to provide data
app.get('/api/data', (req, res) => {
  res.json({
    message: 'Hello from the backend API!',
    data: [1, 2, 3, 4, 5]
  });
});

// API endpoint to accept data for manipulation
app.post('/api/data', (req, res) => {
  const newData = req.body;
  // In a real app, process newData and update your data store
  res.json({
    message: 'Data received',
    received: newData
  });
});

// Start the server
app.listen(port, () => {
  console.log(`Backend server is running on port ${port}`);
});
