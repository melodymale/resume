const update = {
    title: 'A blog post by Kingsley',
    body: 'Brilliant post on fetch API',
    userId: 1,
};

const options = {
    method: 'POST',
    headers: {
        'Content-Type': 'application/json',
    },
    body: JSON.stringify(update),
};

fetch('https://httpbin.org/post', options)
    .then(data => {
        if (!data.ok) {
            throw Error(data.status);
        }
        return data.json();
    }).then(post => {
        console.log(post);
    }).catch(e => {
        console.log(e);
    });