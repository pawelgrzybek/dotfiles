'use strict';
const fetch = require('node-fetch');

fetch(`https://packagist.org/search.json?q=${process.argv[2]}`)
.then(response => response.json())
.then(data => {

  const packages = {
    items: []
  };

  data.results.map(item => {
    packages.items.push({
      title: `${item.name}`,
      subtitle: `${item.description} (favers: ${item.favers}, downloads: ${item.downloads})`,
      arg: `${item.url}`,
      text: {
        copy: `${item.url}`,
        largetype: `${item.url}`
      },
    });
  });
  console.log(JSON.stringify(packages));
})
.catch(error => {
  console.log(JSON.stringify({
    items: [{
      title: error.name,
      subtitle: error.message,
      valid: false,
      text: {
        copy: error.stack
      }
    }]
  }));
});
