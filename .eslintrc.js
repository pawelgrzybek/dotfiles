module.exports = {
  'env': {
    'browser': true,
    'commonjs': true,
    'es6': true,
    'node': true,
    'jquery': true
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
      2,
      'never'
    ],
    'no-console': [
      1
    ],
    'no-debugger': [
      1
    ],
    'no-dupe-args': [
      2
    ],
    'no-dupe-keys': [
      2
    ],
    'no-duplicate-case': [
      2
    ],
    'no-empty': [
      2
    ],
    'no-extra-boolean-cast': [
      2
    ],
    'no-extra-parens': [
      2,
      'all'
    ],
    'no-extra-semi': [
      2
    ],
    'no-func-assign': [
      2
    ],
    'no-inner-declarations': [
      1
    ],
    'no-sparse-arrays': [
      2
    ],
    'no-unexpected-multiline': [
      2
    ],
    'no-unreachable': [
      2
    ],
    'use-isnan': [
      2
    ],
    'valid-typeof': [
      2
    ],
    'consistent-return': [
      2
    ],
    'curly': [
      2
    ],
    'default-case': [
      2
    ],
    'eqeqeq': [
      2,
      'smart'
    ],
    'no-caller': [
      2
    ],
    'no-empty-function': [
      2
    ],
    'no-empty-pattern': [
      2
    ],
    'no-eq-null': [
      2
    ],
    'no-eval': [
      2
    ],
    'no-extra-label': [
      2
    ],
    'no-floating-decimal': [
      2
    ],
    'no-implied-eval': [
      2
    ],
    'no-loop-func': [
      2
    ],
    'no-multi-spaces': [
      2
    ],
    'no-proto': [
      2
    ],
    'no-redeclare': [
      2
    ],
    'no-self-assign': [
      2
    ],
    'no-self-compare': [
      2
    ],
    'no-sequences': [
      2
    ],
    'no-with': [
      2
    ],
    'wrap-iife': [
      2,
      'inside'
    ],
    'init-declarations': [
      2,
      'always'
    ],
    'no-undef': [
      2
    ],
    'no-undef-init': [
      2
    ],
    'no-unused-vars': [
      2
    ],
    'no-use-before-define': [
      2
    ],
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
    'camelcase': [
      2
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
    'eol-last': [
      2
    ],
    'indent': [
      2,
      2
    ],
    'jsx-quotes': [
      2,
      'prefer-single'
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
    'new-cap': [
      2
    ],
    'new-parens': [
      2
    ],
    'no-mixed-spaces-and-tabs': [
      2
    ],
    'no-nested-ternary': [
      2
    ],
    'no-spaced-func': [
      2
    ],
    'no-trailing-spaces': [
      2
    ],
    'no-whitespace-before-property': [
      2
    ],
    'object-curly-spacing': [
      2,
      'always'
    ],
    'one-var': [
      2,
      'never'
    ],
    'one-var-declaration-per-line': [
      2,
      'always'
    ],
    'operator-assignment': [
      2,
      'always'
    ],
    'padded-blocks': [
      2,
      'never'
    ],
    'quotes': [
      2,
      'single'
    ],
    'semi': [
      2,
      'always'
    ],
    'semi-spacing': [
      2,
      {
        'before': false,
        'after': true
      }
    ],
    'space-before-blocks': [
      2
    ],
    'space-before-function-paren': [
      2,
      'never'
    ],
    'space-in-parens': [
      2,
      'never'
    ],
    'space-infix-ops': [
      2
    ],
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
    'template-curly-spacing': [
      2,
      'never'
    ],
    'react/jsx-uses-react': [
      2
    ],
    'react/jsx-uses-vars': [
      2
    ]
  }
};
