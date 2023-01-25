const update = {
    "operation": "update"
};

const options = {
    method: 'POST',
    headers: {
        'Content-Type': 'application/json',
        'x-api-key': 'IIAXtEb0Ez6YglwILjNmU9Op1Vp1GxGu2WTF1FOx'
    },
    body: JSON.stringify(update),
};

fetch('https://gu2ecu5qtc.execute-api.ap-southeast-2.amazonaws.com/prod/visitorcounting', options)
    .then(data => {
        if (!data.ok) {
            throw Error(data.status);
        }
        return data.json();
    }).then(post => {
        console.log(post);
        document.getElementById("visitor-count").innerHTML = post.count;
    }).catch(e => {
        console.log(e);
    });