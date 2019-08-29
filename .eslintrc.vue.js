module.exports = {
  root: true,
    env: {
      node: true
    },
    extends: ['plugin:vue/recommended'],
    rules: {
      'import/order': 'error',
      'brace-style': ['error'],
        'curly': ['error', 'multi-line'],
        'quotes': ['error', 'single'],
        'key-spacing': [2, { beforeColon: false, afterColon: true }],
        'comma-dangle': ['error', 'never'],
        'object-curly-spacing': ['error', 'always'],
        'vue/v-on-style': ['error', 'shorthand'],
        'vue/script-indent': ['error', 2, { baseIndent: 0, switchCase: 1 }],
        'semi': ['error', 'never'],
        'no-console': process.env.NODE_ENV === 'production' ? 'error' : 'off',
        'no-debugger': process.env.NODE_ENV === 'production' ? 'error' : 'off'
    },
    parserOptions: {
      parser: 'babel-eslint',
        ecmaVersion: 8
    }
}

