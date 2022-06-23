/**
 * Route application module.
 * @author Carlos Emanuel Balcazar
 */
const express = require('express');
const router = express.Router();
const orientDBService = require('../services/orientdb.service');

// root route.
router.get('/', (req, res) => {
    res.render('index.html');
});

router.get('/graph', async (req, res) => {
    const result = await orientDBService.getGraph();
    res.json(result);
});

module.exports = router;