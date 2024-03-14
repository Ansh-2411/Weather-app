const express = require('express')
const mongoose = require('mongoose')
const data = require("./config")
const cors = require('cors')

const app = express()
const corsOptions = {
    origin:"*",
    methods: "GET",
    credentials: true
}
app.use(cors(corsOptions));

app.use(express.json())

app.use(express.urlencoded({ extended: false }))


mongoose.set('strictQuery', false)

app.get("/", async (req, res) => {
    const result = await data.find()
    res.send(result)
})
app.listen(3000, () => {
    console.log(`running on port ${3000}`)
})