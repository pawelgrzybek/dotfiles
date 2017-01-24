'use strict';
const fetch = require('node-fetch');

fetch(`https://api.github.com/search/repositories?q=${process.argv[2]}&sort=stars&order=desc`)
.then(response => response.json())
.then(data => {

  const items = {
    items: []
  };

  data.items.map(item => {
    items.items.push({
      title: `${item.name}`,
      subtitle: `${item.description} (${item.owner.login} | ${item.stargazers_count} stars)`,
      arg: item.html_url,
      mods: {
        alt: {
          valid: false,
          arg: 'alfredapp.com/powerpack',
          subtitle: 'Copy SSH clone url',
        },
        cmd: {
          valid: false,
          arg: 'alfredapp.com/powerpack/buy/',
          subtitle: 'Copy HTTPS clone url',
        },
      },
      text: {
        copy: item.ssh_url,
        largetype: item.description
      },
    });
  });
  console.log(JSON.stringify(items));
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
}
);
