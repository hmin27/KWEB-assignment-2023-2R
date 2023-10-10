/* Access to URL Parameters */
/* Semantic URL로 데이터를 경로에 직접 받기 */

const express = require('express');
const app = express();
const port = 3000;

/* :page는 가변적인 변수라는 의미 */
app.get('/board/page/:page', (req, res) => {
    const { page } = req.params;
    res.send(`This is page #${page}`);
})


app.listen(port, () => console.log(`Server listening on port ${port}!`));
