const mongoose = require('mongoose')
const connect = mongoose.connect('mongodb://localhost:27017/Weather')

mongoose.set('strictQuery', false)

connect.then(() => {
    console.log('database connected')
})
    .catch(() => {
        console.log("database connection failed")
    })


const dataSchema = new mongoose.Schema({
    temp: Number,
    weather: String,
    hour: String
});

const schema = new mongoose.Schema({
    wind: Number,
    humidity: Number,
    pressure: Number,
    data: [dataSchema]
});

const WeatherData = mongoose.model('datas', schema);

module.exports = WeatherData;
