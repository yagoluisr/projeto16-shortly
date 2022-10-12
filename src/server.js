import expres from 'express';

const server = expres();


server.get('/status', (req, res) => {
    res.send('OK !')
})


server.listen(5000, () => {
    console.log('listening on port 5000')
})