require('dotenv').config({path:'../../.env'});
const express = require('express');
// const fetch = require('node-fetch');
const app = express();

const PORT = process.env.PORT;

app.get('/events-impact', async (req, res) => {
    const { startDate, endDate, location = 'Rio de Janeiro', radius = 10000 } = req.query;

    const url = `https://hoteldiscoveryapi.p.rapidapi.com/api/locations/${location}/events-impact?startDate=${startDate}&endDate=${endDate}&radius=${radius}`;
    const options = {
        method: 'GET',
        headers: {
            'x-rapidapi-key': '3cb1dabf9dmsh5aa7a567a8a97dfp108d94jsn55d378ad44a0',
            'x-rapidapi-host': 'hoteldiscoveryapi.p.rapidapi.com'
        }
    };
    try {
        const response = await fetch(url, options);
        const data = await response.json();
        res.json(data);
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'Erro ao buscar dados da API externa' });
    }
});
app.get('/hotels-search', async (req, res) => {
    const {
        q = 'London Hotels',
        check_in_date,
        check_out_date,
        adults = 2,
        children = 0,
        currency = 'USD',
        gl = 'uk',
        hl = 'en'
    } = req.query;

    if (!check_in_date || !check_out_date) {
        return res.status(400).json({ error: 'Parâmetros check_in_date e check_out_date são obrigatórios.' });
    }

    const encodedQuery = encodeURIComponent(q);
    const url = `https://hoteldiscoveryapi.p.rapidapi.com/api/hotels/destination/search?q=${encodedQuery}&check_in_date=${check_in_date}&check_out_date=${check_out_date}&adults=${adults}&children=${children}&currency=${currency}&gl=${gl}&hl=${hl}`;

    const options = {
        method: 'GET',
        headers: {
            'x-rapidapi-key': '3cb1dabf9dmsh5aa7a567a8a97dfp108d94jsn55d378ad44a0',
            'x-rapidapi-host': 'hoteldiscoveryapi.p.rapidapi.com'
        }
    };
    try {
        const response = await fetch(url, options);
        const data = await response.json();
        res.json(data);
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'Erro ao buscar dados da API de hotéis' });
    }
});
app.get('/hotels-autocomplete', async (req, res) => {
    const {
        input = 'Marriott Paris',
        types = 'lodging'
    } = req.query;

    const encodedInput = encodeURIComponent(input);
    const url = `https://hoteldiscoveryapi.p.rapidapi.com/api/hotels/autocomplete/search?input=${encodedInput}&types=${types}`;

    const options = {
        method: 'GET',
        headers: {
            'x-rapidapi-key': '3cb1dabf9dmsh5aa7a567a8a97dfp108d94jsn55d378ad44a0',
            'x-rapidapi-host': 'hoteldiscoveryapi.p.rapidapi.com'
        }
    };
    try {
        const response = await fetch(url, options);
        const data = await response.json();
        res.json(data);
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'Erro ao buscar dados de autocomplete' });
    }
});
app.get('/hotel-details/:hotelId', async (req, res) => {
    const { hotelId } = req.params;
    const { placeId } = req.query;

    if (!placeId) {
        return res.status(400).json({ error: 'Parâmetro placeId é obrigatório.' });
    }

    const url = `https://hoteldiscoveryapi.p.rapidapi.com/api/hotels/${hotelId}?placeId=${placeId}`;

    const options = {
        method: 'GET',
        headers: {
            'x-rapidapi-key': '3cb1dabf9dmsh5aa7a567a8a97dfp108d94jsn55d378ad44a0',
            'x-rapidapi-host': 'hoteldiscoveryapi.p.rapidapi.com'
        }
    };
    try {
        const response = await fetch(url, options);
        const data = await response.json();
        res.json(data);
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'Erro ao buscar detalhes do hotel' });
    }
});
app.get('/hotel-photos/:placeId', async (req, res) => {
    const { placeId } = req.params;

    const url = `https://hoteldiscoveryapi.p.rapidapi.com/api/hotels/${placeId}/photos`;

    const options = {
        method: 'GET',
        headers: {
            'x-rapidapi-key': '3cb1dabf9dmsh5aa7a567a8a97dfp108d94jsn55d378ad44a0',
            'x-rapidapi-host': 'hoteldiscoveryapi.p.rapidapi.com'
        }
    };
    try {
        const response = await fetch(url, options);
        const data = await response.json();
        res.json(data);
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'Erro ao buscar fotos do hotel' });
    }
});
app.get('/api/hotels/:placeId/photos', async (req, res) => {
    const { placeId } = req.params;

    const url = `https://hoteldiscoveryapi.p.rapidapi.com/api/hotels/${placeId}/photos`;

    const options = {
        method: 'GET',
        headers: {
            'x-rapidapi-key': '3cb1dabf9dmsh5aa7a567a8a97dfp108d94jsn55d378ad44a0',
            'x-rapidapi-host': 'hoteldiscoveryapi.p.rapidapi.com'
        }
    };
    try {
        const response = await fetch(url, options);
        const result = await response.json(); // .json() é melhor que .text() nesse caso
        res.json(result);
    } catch (error) {
        console.error('Erro ao buscar fotos do hotel:', error);
        res.status(500).json({ error: 'Erro ao buscar fotos do hotel.' });
    }
});
app.get('/api/hotels/:placeId/similar', async (req, res) => {
    const { placeId } = req.params;
    const limit = req.query.limit || 5;

    const url = `https://hoteldiscoveryapi.p.rapidapi.com/api/hotels/${placeId}/similar?limit=${limit}`;

    const options = {
        method: 'GET',
        headers: {
            'x-rapidapi-key': '3cb1dabf9dmsh5aa7a567a8a97dfp108d94jsn55d378ad44a0',
            'x-rapidapi-host': 'hoteldiscoveryapi.p.rapidapi.com'
        }
    };
    try {
        const response = await fetch(url, options);
        const result = await response.json();
        res.json(result);
    } catch (error) {
        console.error('Erro ao buscar hotéis similares:', error);
        res.status(500).json({ error: 'Erro ao buscar hotéis similares.' });
    }
});

app.get('/api/hotels/:placeId/nearby-map', async (req, res) => {
    const { placeId } = req.params;
    const { radius = 1000, types = 'restaurant,museum', limit = 10 } = req.query;

    const url = `https://hoteldiscoveryapi.p.rapidapi.com/api/hotels/${placeId}/nearby-map?radius=${radius}&types=${types}&limit=${limit}`;

    const options = {
        method: 'GET',
        headers: {
            'x-rapidapi-key': '3cb1dabf9dmsh5aa7a567a8a97dfp108d94jsn55d378ad44a0',
            'x-rapidapi-host': 'hoteldiscoveryapi.p.rapidapi.com'
        }
    };
    try {
        const response = await fetch(url, options);
        const result = await response.json();
        res.json(result);
    } catch (error) {
        console.error('Erro ao buscar locais próximos ao hotel:', error);
        res.status(500).json({ error: 'Erro ao buscar locais próximos ao hotel.' });
    }
});

app.listen(PORT, () => {
    console.log(`Servidor rodando na porta ${PORT}`);
});