# The CV of emeraldjava

[![Build Status](https://github.com/emeraldjava/emeraldjava/workflows/build/badge.svg)](https://github.com/emeraldjava/emeraldjava)

The CV appears at [https://emeraldjava.github.io/emeraldjava/](http://emeraldjava.github.io/emeraldjava/)

## hackmyresume

```
hackmyresume VALIDATE resume.json
hackmyresume BUILD src/main/resources/json/fresh/resume.json to ./out/resume.all
hackmyresume BUILD src/main/resources/json/fresh/resume.json TO out/resume.all --theme compact
hackmyresume BUILD src/main/resources/json/fresh/resume.json TO out/resume.all -t awesome
```
see https://github.com/hacksalot/HackMyResume

## Fresh

    hackmyresume CONVERT src/main/resources/json/fresh/resume.json src/main/resources/json/fresh/jsonresume.json

## Kiss My Resume

    node ./node_modules/kiss-my-resume/cli.js new new.json
    node ./node_modules/kiss-my-resume/cli.js build ./src/main/resources/json/resume/jsonresume.json --theme rocketspacer
    node ./node_modules/kiss-my-resume/cli.js build ./src/main/resources/json/resume/jsonresume.json -f HTML -o target -n index -t rocketspacer

## Json Resume Themes

    npm i jsonresume-theme-material
    npm i jsonresume-theme-stackoverflow
    npm i jsonresume-theme-elegant
    npm i jsonresume-theme-modern
    npm i jsonresume-theme-classy
    npm i jsonresume-theme-onepage
    npm i jsonresume-theme-short
    npm i jsonresume-theme-jsonresume-theme-rocketspacer
    npm i jsonresume-theme-caffeine

## resumefodder

https://resumefodder.com/generate.html

## jsonresume-theme-caffeine

- https://github.com/kelyvin/jsonresume-theme-caffeine