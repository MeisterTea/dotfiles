module.exports = {
    "extends": [
        "stylelint-config-standard",
        "stylelint-config-recommended-scss",
        "stylelint-config-recess-order"
    ],
    "rules": {
        "font-family-no-missing-generic-family-keyword": null,
        "no-descending-specificity": null,
        "color-hex-length": null,
        "selector-list-comma-newline-after": "always-multi-line",
        "selector-list-comma-space-after": "always-single-line",
        "block-closing-brace-newline-before": "always",
        "declaration-block-semicolon-newline-after": "always",
        "value-list-comma-newline-before": "never-multi-line",
        "value-list-comma-newline-after": "always"
    }
}
