// Apply best pratices by enabling eslint:recommended
// Never repeat rules that eslint:recommended sets as a default
// Explicitly add more rules categorized in categories taken from official docs

module.exports = {
  'env': {
    'browser': true,
    'commonjs': true,
    'es6': true,
    'node': true,
    'jquery': true,
    'serviceworker': true
  },
  'extends': 'eslint:recommended',
  'parserOptions': {
    'ecmaFeatures': {
      'experimentalObjectRestSpread': true,
      'jsx': true,
      'impliedStrict': true
    },
    'sourceType': 'module'
  },
  'plugins': [
    'react'
  ],
  'rules': {
    // Possible Errors
    'no-extra-parens': [
      2,
      'functions'
    ],
    'no-template-curly-in-string': 2,
    'no-unsafe-negation': 2,

    // Best Practices
    'accessor-pairs': [
      2,
      {
        'setWithoutGet': true,
        'getWithoutSet': true,
      }
    ],
    'array-callback-return': 2,
    'block-scoped-var': 2,
    'consistent-return': 2,
    'curly': 2,
    'default-case': 2,
    'dot-notation': 2,
    'eqeqeq': [
      2,
      'smart'
    ],
    'guard-for-in': 2,
    'no-alert': 1,
    'no-caller': 2,
    'no-div-regex': 2,
    'no-else-return': 2,
    'no-empty-function': 2,
    'no-eq-null': 2,
    'no-eval': 2,
    'no-extend-native': 2,
    'no-extra-bind': 2,
    'no-extra-label': 2,
    'no-floating-decimal': 2,
    'no-global-assign': 2,
    'no-implied-eval': 2,
    'no-invalid-this': 2,
    'no-lone-blocks': 2,
    'no-loop-func': 2,
    'no-magic-numbers': 2,
    'no-multi-spaces': 2,
    'no-proto': 2,
    'no-return-assign': 2,
    'no-self-compare': 2,
    'no-sequences': 2,
    'no-unused-expressions': 2,
    'no-useless-call': 2,
    'no-useless-concat': 2,
    'no-useless-escape': 2,
    'no-void': 2,
    'no-with': 2,
    'radix': 2,
    'wrap-iife': [
      2,
      'inside'
    ],
    'yoda': [
      2,
      'never'
    ],

    // Strict Mode
    'strict': 2,

    // Variables
    'init-declarations': [
      2,
      'always'
    ],
    'no-label-var': 2,
    'no-undef-init': 2,
    'no-undefined': 2,
    'no-use-before-define': 2,

    // Stylistic Issues
    'array-bracket-spacing': [
      1,
      'never'
    ],
    'block-spacing': [
      2,
      'always'
    ],
    'brace-style': [
      2,
      'stroustrup',
      {
        'allowSingleLine': false
      }
    ],
    'camelcase': 2,
    'comma-dangle': [
      2,
      'never'
    ],
    'comma-spacing': [
      2,
      {
        'before': false,
        'after': true
      }
    ],
    'comma-style': [
      2,
      'last'
    ],
    'computed-property-spacing': [
      2,
      'never'
    ],
    'eol-last': 2,
    'func-call-spacing': [
      2,
      'never'
    ],
    'func-style': 2,
    'indent': [
      2,
      2
    ],
    'jsx-quotes': [
      2,
      'prefer-double'
    ],
    'key-spacing': [
      2,
      {
        'beforeColon': false,
        'afterColon': true
      }
    ],
    'keyword-spacing': [
      2,
      {
        'before': true,
        'after': true
      }
    ],
    'linebreak-style': [
      2,
      'unix'
    ],
    'max-depth': 2,
    'new-cap': 2,
    'new-parens': 2,
    'no-lonely-if': 2,
    'no-nested-ternary': 2,
    'no-tabs': 2,
    'no-trailing-spaces': 2,
    'no-underscore-dangle': 2,
    'no-unneeded-ternary': 2,
    'no-whitespace-before-property': 2,
    'object-curly-spacing': [
      2,
      'always'
    ],
    'object-property-newline': 2,
    'one-var-declaration-per-line': [
      2,
      'always'
    ],
    'one-var': [
      2,
      'never'
    ],
    'operator-assignment': [
      2,
      'always'
    ],
    'quote-props': [
      2,
      'as-needed'
    ],
    'quotes': [
      2,
      'single'
    ],
    'semi-spacing': [
      2,
      {
        'before': false,
        'after': true
      }
    ],
    'semi': [
      2,
      'always'
    ],
    'space-before-blocks': 2,
    'space-before-function-paren': [
      2,
      'never'
    ],
    'space-in-parens': [
      2,
      'never'
    ],
    'space-infix-ops': 2,
    'space-unary-ops': [
      2,
      {
        'words': true,
        'nonwords': false
      }
    ],
    'spaced-comment': [
      2,
      'always'
    ],

    // ECMAScript 6
    'arrow-parens': [
      2,
      'as-needed'
    ],
    'arrow-spacing': [
      2,
      {
        'before': true,
        'after': true
      }
    ],
    'generator-star-spacing': [
      2,
      {
        'before': false,
        'after': true
      }
    ],
    'no-confusing-arrow': 2,
    'no-const-assign': 2,
    'no-duplicate-imports': 2,
    'no-restricted-imports': 2,
    'no-this-before-super': 2,
    'no-useless-computed-key': 2,
    'no-useless-constructor': 2,
    'no-useless-rename': 2,
    'no-var': 2,
    'prefer-arrow-callback': 2,
    'prefer-const': 2,
    'prefer-template': 2,
    'prefer-template': 2,
    'require-yield': 2,
    'template-curly-spacing': [
      2,
      'never'
    ],

    // Plugins specific
    'react/jsx-uses-react': 2,
    'react/jsx-uses-vars': 2,
  }
};
