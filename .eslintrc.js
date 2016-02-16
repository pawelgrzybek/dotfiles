module.exports = {
  "env": {
    "browser": true,
    "commonjs": true,
    "es6": true,
    "node": true,
    "jquery": true
  },
  "extends": "eslint:recommended",
  "parserOptions": {
    "ecmaFeatures": {
      "experimentalObjectRestSpread": true,
      "jsx": true,
      "impliedStrict": true
    },
    "sourceType": "module"
  },
  "plugins": [
    "react"
  ],
  "rules": {
    "linebreak-style": [
      2,
      "unix"
    ],
    "array-bracket-spacing": [
      1,
      "never"
    ],
    "block-spacing": [
      1,
      "always"
    ],
    "brace-style": [
      1,
      "stroustrup",
      {
        "allowSingleLine": false
      }
    ],
    "camelcase": [
      2
    ],
    "comma-spacing": [
      2,
      {
        "before": false,
        "after": true
      }
    ],
    "comma-style": [
      2,
      "last"
    ],
    "computed-property-spacing": [
      2,
      "never"
    ],
    "indent": [
      1,
      2
    ],
    "newline-after-var": [
      0,
      "always"
    ],
    "no-console": [
      0
    ],
    "no-mixed-spaces-and-tabs": [
      2,
      "smart-tabs"
    ],
    "no-nested-ternary": [
      2
    ],
    "object-curly-spacing": [
      2,
      "always"
    ],
    "one-var": [
      2,
      "never"
    ],
    "quotes": [
      2,
      "single"
    ],
    "semi-spacing": [
      2,
      {
        "before": false,
        "after": true
      }
    ],
    "semi": [
      2,
      "always"
    ],
    "keyword-spacing": [
      2
    ],
    "space-before-blocks": [
      2
    ],
    "space-before-function-paren": [
      2,
      "never"
    ],
    "space-in-parens": [
      2,
      "never"
    ],
    "space-infix-ops": [
      2,
      {
        "int32Hint": false
      }
    ],
    "space-unary-ops": [
      1,
      {
        "words": true,
        "nonwords": false
      }
    ],
  }
};
