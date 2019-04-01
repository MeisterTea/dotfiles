module.exports = {
  'root': true,
  'env': {
    'node': true,
    'es6': true,
    "react-native/react-native": true,
    "jest/globals": true
  },
  "plugins": [
    "react",
    "react-native",
    "jest",
    "chai-expect"
  ],
  'parser': 'babel-eslint',
  "extends": [
    "eslint:recommended",
    "plugin:react/recommended"
  ],
  'rules': {
    "comma-spacing": 'error',
    "arrow-spacing": 'error',
    'no-multiple-empty-lines': ["error", { "max": 1, "maxEOF": 1}],
    'space-in-parens': ["error", "never"],
    "indent": ["error", 2, {"SwitchCase": 1, "ignoredNodes": ["JSXElement"]}],
    'no-multi-spaces': 'error',
    'no-trailing-spaces': 'error',
    'brace-style': ['error'],
    'curly': ['error', 'multi-line'],
    'quotes': ['error', 'single'],
    'key-spacing': [2, { beforeColon: false, afterColon: true }],
    'comma-dangle': ['error', 'never'],
    'object-curly-spacing': ['error', 'always', { "objectsInObjects": false }],
    'semi': ['error', 'never'],
    "comma-dangle": [2, "always-multiline"],
    "array-bracket-spacing": ["error", "never"],
    "react/prefer-stateless-function": "error",
    "react/jsx-handler-names": "error",
    "react/jsx-tag-spacing": 'error',
    "react/no-multi-comp": 'error',
    "react/no-unused-prop-types": 'error',
    "react/jsx-indent-props": [2, 2],
    "react/require-optimization": 'error',
    "react/no-this-in-sfc": 'error',
    "react/jsx-sort-default-props": 'error',
    "react/jsx-closing-tag-location": 'error',
    "react/no-unused-prop-types": 'error',
    "react/no-unused-state": 'error',
    "react/prop-types": ["error", { "ignore": ["navigation"] }],
    "react/jsx-one-expression-per-line": [1, { "allow": "single-child" }],
    "react/jsx-indent": ["error", 2],
    "react/jsx-curly-spacing": [2, {"when": "always", "allowMultiline": false}],
    'react/jsx-max-props-per-line': [1, { "maximum": 1 }],
    "react/jsx-equals-spacing": 'error',
    "react/sort-prop-types": [1, {
      "callbacksLast": true,
      "ignoreCase": true,
    }],
    "react/jsx-sort-props": [1, {
      "callbacksLast": true,
      "ignoreCase": true,
    }],
    "react/jsx-closing-bracket-location": 'error',
    "react/forbid-prop-types": 'warn',
    "react/require-default-props": 'warn',
    "react-native/no-unused-styles": 2,
    "react-native/split-platform-components": 2,
    "react-native/no-inline-styles": 2,
    "react-native/no-color-literals": 2,
    "react-native/no-raw-text": 2,
    'no-console': process.env.NODE_ENV === 'production' ? 'error' : 'off',
    'no-debugger': process.env.NODE_ENV === 'production' ? 'error' : 'off'
  },
  "overrides": [
    {
      "files": ["*test.js"],
      "rules": {
        "chai-expect/missing-assertion": 2,
        "chai-expect/terminating-properties": 1,
        "jest/no-disabled-tests": "warn",
        "jest/no-focused-tests": "error",
        "jest/no-identical-title": "error",
        "jest/prefer-to-have-length": "warn",
      }
    }
  ],
  'parserOptions': {
    'parser': 'babel-eslint',
    'sourceType': "module",
    'ecmaVersion': 10,
    'ecmaFeatures': {
      'jsx': true,
      'modules': true,
      'experimentalObjectRestSpread': true
    }
  },
  'settings': {
    'react': {
      'pragma': 'React',
      'version': '15.6.1'
    }
  }
}
