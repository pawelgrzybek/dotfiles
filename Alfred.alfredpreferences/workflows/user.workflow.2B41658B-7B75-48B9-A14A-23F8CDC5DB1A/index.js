'use strict';
const fetch = require('node-fetch');

fetch(`https://api.npms.io/v2/search?q=${process.argv[2]}`)
.then(response => response.json())
.then(data => {

  const packages = {
    items: []
  };

  data.results.map(item => {

    packages.items.push({
      title: `${item.package.name}`,
      subtitle: `${item.package.description} (version ${item.package.version})`,
      arg: `https://www.npmjs.com/package/${item.package.name}`,
      mods: {
        cmd: {
          valid: item.package.links.repository ? true : false,
          arg: item.package.links.repository,
          subtitle: item.package.links.repository ? 'Open repository on Github' : 'Missing repository link',
        },
        alt: {
          valid: item.package.links.bugs ? true : false,
          arg: item.package.links.bugs,
          subtitle: item.package.links.bugs ? 'Open Issues' : 'Missing bug links',
        }
      },
      text: {
        copy: `https://www.npmjs.com/package/${item.package.name}`,
        largetype: `https://www.npmjs.com/package/${item.package.name}`
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
