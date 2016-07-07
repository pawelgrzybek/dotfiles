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
    'comma-dangle': [
      'error',
      'never'
    ],
    'no-console': 'warn',
    'no-debugger': 'warn',
    'no-dupe-args': 'error',
    'no-dupe-keys': 'error',
    'no-duplicate-case': 'error',
    'no-empty': 'error',
    'no-extra-boolean-cast': 'error',
    'no-extra-parens': [
      'error',
      'functions'
    ],
    'no-extra-semi': 'error',
    'no-func-assign': 'error',
    'no-inner-declarations': 'warn',
    'no-sparse-arrays': 'error',
    'no-unexpected-multiline': 'error',
    'no-unreachable': 'error',
    'use-isnan': 'error',
    'valid-typeof': 'error',
    'consistent-return': 'error',
    'curly': 'error',
    'default-case': 'error',
    'dot-notation': [
      'error',
    ],
    'eqeqeq': [
      'error',
      'smart'
    ],
    'no-caller': 'error',
    'no-empty-function': 'error',
    'no-empty-pattern': 'error',
    'no-eq-null': 'error',
    'no-eval': 'error',
    'no-extra-label': 'error',
    'no-floating-decimal': 'error',
    'no-implied-eval': 'error',
    'no-loop-func': 'error',
    'no-multi-spaces': 'error',
    'no-proto': 'error',
    'no-redeclare': 'error',
    'no-self-assign': 'error',
    'no-self-compare': 'error',
    'no-sequences': 'error',
    'no-with': 'error',
    'wrap-iife': [
      'error',
      'inside'
    ],
    'init-declarations': [
      'error',
      'always'
    ],
    'no-undef': 'error',
    'no-undef-init': 'error',
    'no-unused-vars': 'error',
    'no-use-before-define': 'error',
    'array-bracket-spacing': [
      'warn',
      'never'
    ],
    'block-spacing': [
      'error',
      'always'
    ],
    'brace-style': [
      'error',
      'stroustrup',
      {
        'allowSingleLine': false
      }
    ],
    'camelcase': 'error',
    'comma-spacing': [
      'error',
      {
        'before': false,
        'after': true
      }
    ],
    'comma-style': [
      'error',
      'last'
    ],
    'computed-property-spacing': [
      'error',
      'never'
    ],
    'eol-last': 'error',
    'indent': [
      'error',
      2
    ],
    'jsx-quotes': [
      'error',
      'prefer-double'
    ],
    'key-spacing': [
      'error',
      {
        'beforeColon': false,
        'afterColon': true
      }
    ],
    'keyword-spacing': [
      'error',
      {
        'before': true,
        'after': true
      }
    ],
    'linebreak-style': [
      'error',
      'unix'
    ],
    'new-cap': 'error',
    'new-parens': 'error',
    'no-mixed-spaces-and-tabs': 'error',
    'no-nested-ternary': 'error',
    'no-spaced-func': 'error',
    'no-trailing-spaces': 'error',
    'no-whitespace-before-property': 'error',
    'object-curly-spacing': [
      'error',
      'always'
    ],
    'one-var': [
      'error',
      'never'
    ],
    'object-property-newline': 'error',
    'one-var-declaration-per-line': [
      'error',
      'always'
    ],
    'operator-assignment': [
      'error',
      'always'
    ],
    'quotes': [
      'error',
      'single'
    ],
    'semi': [
      'error',
      'always'
    ],
    'semi-spacing': [
      'error',
      {
        'before': false,
        'after': true
      }
    ],
    'space-before-blocks': 'error',
    'space-before-function-paren': [
      'error',
      'never'
    ],
    'space-in-parens': [
      'error',
      'never'
    ],
    'space-infix-ops': 'error',
    'space-unary-ops': [
      'error',
      {
        'words': true,
        'nonwords': false
      }
    ],
    'spaced-comment': [
      'error',
      'always'
    ],
    'template-curly-spacing': [
      'error',
      'never'
    ],
    'react/jsx-uses-react': 'error',
    'react/jsx-uses-vars': 'error',
    'no-useless-computed-key': 'error',
    'no-useless-constructor': 'error'
  }
};
