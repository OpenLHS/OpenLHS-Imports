---
layout: ontology_detail
id: OpenLHS-Imports
title: External imports ontology
jobs:
  - id: https://travis-ci.org/OpenLHS/OpenLHS-Imports
    type: travis-ci
build:
  checkout: git clone https://github.com/OpenLHS/OpenLHS-Imports.git
  system: git
  path: "."
contact:
  email: 
  label: 
  github: 
description: External imports ontology is an ontology...
domain: stuff
homepage: https://github.com/OpenLHS/OpenLHS-Imports
products:
  - id: OpenLHS-Imports.owl
    name: "External imports ontology main release in OWL format"
  - id: OpenLHS-Imports.obo
    name: "External imports ontology additional release in OBO format"
  - id: OpenLHS-Imports.json
    name: "External imports ontology additional release in OBOJSon format"
  - id: OpenLHS-Imports/OpenLHS-Imports-base.owl
    name: "External imports ontology main release in OWL format"
  - id: OpenLHS-Imports/OpenLHS-Imports-base.obo
    name: "External imports ontology additional release in OBO format"
  - id: OpenLHS-Imports/OpenLHS-Imports-base.json
    name: "External imports ontology additional release in OBOJSon format"
dependencies:
- id: bfo
- id: ro
- id: obi
- id: iao
- id: omrse

tracker: https://github.com/OpenLHS/OpenLHS-Imports/issues
license:
  url: http://creativecommons.org/licenses/by/3.0/
  label: CC-BY
activity_status: active
---

Enter a detailed description of your ontology here. You can use arbitrary markdown and HTML.
You can also embed images too.

