#!/usr/bin/env bash
rm -rf ./out*
hackmyresume VALIDATE ./resume.json
hackmyresume BUILD ./resume.json out-compact/paul.oconnell-resume.all -t compact
#hackmyresume BUILD ./resume.json out-modern/resume.all -t modern
#hackmyresume BUILD ./resume.json out-basis/resume.all -t basis
#hackmyresume BUILD ./resume.json out-awesome/resume.all -t awesome
