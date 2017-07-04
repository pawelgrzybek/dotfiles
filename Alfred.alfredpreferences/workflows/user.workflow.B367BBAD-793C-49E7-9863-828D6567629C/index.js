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
      // mods: {
      //   cmd: {
      //     valid: item.links.repository ? true : false,
      //     arg: item.links.repository,
      //     subtitle: item.links.repository ? 'Open repository on Github' : 'Missing repository link',
      //   },
      //   alt: {
      //     valid: item.links.bugs ? true : false,
      //     arg: item.links.bugs,
      //     subtitle: item.links.bugs ? 'Open Issues' : 'Missing bug links',
      //   }
      // },
      // text: {
      //   copy: `https://www.npmjs.com/package/${item.name}`,
      //   largetype: `https://www.npmjs.com/package/${item.name}`
      // },
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
