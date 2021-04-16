#!/bin/sh
NODE_ENV=production npx tailwindcss-cli@latest build ./src/css/app.css -o ./public/assets/css/app.css
