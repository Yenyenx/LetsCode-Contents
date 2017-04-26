---
title: "Summary - Let's Code - Week 14"
date: "April, 2017"
output: 
  html_document: 
    theme: readable
---

We discuss the design and architecture of the web app we want to create, a.k.a. the common challenge to achieve as an end the first session of **Let's Code**.

The app will be a web app using shiny dashboard. It's called Streetlight and will do some stuff around streetlights in Paris using data collected from the open data paris website. Details of the specification and the code of the app can be found under the challenge subfolder.

During this session, Mathilde has setup the core architecture of the app using an **ui.R** and **server.R** file as expected. Then the ui content is split into 4 subfiles : one for each tab. Global variables like the address of the website where the data can be found will be stored in **Global.R**.

The app is already running. At this point, it is doing nothing. Tab contents need to be created. First step would be to load the data and filter it to show a first raw table. New features should be developped in a separate stand alone R script file before being integrated to the app.