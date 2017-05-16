---
title: "StreetLight Specifications"
date: "April 21, 2017"
output: 
  html_document: 
    theme: readable
---

# Main purpose

StreetLight is a Shiny Web application whose aim is to get familiar with the street light infrastructure of Paris using data freely available at <https://opendata.paris.fr/explore/dataset/eclairage-public/>.

**Describe use cases**:
* number of public lights in Paris,
* their geographic dispersion,
* their energy consumption and cost depending on power prices and night duration.

The main target is a rapid assessment of the energy consumption in Paris with the intent to identify potential savings.

# Practical implementation

Describe here how we will proceed to get the data, and treat them and then retrieve them.


## Technical documentation

La puissance nominale d’un appareil électrique est la puissance électrique qu’il reçoit lorsqu’il est soumis à sa tension nominale (lorsqu’il fonctionne normalement). On doit distinguer la puissance nominale de la lampe indiquée sur le culot de la lampe de la puissance consommée. La bonne puissance est celle réellement consommée par la lampe. En effet en courant alternatif, la formule $P = UI$ n’est valable que pour les appareils à effet thermique (radiateur électrique par exemple).
 
 
# Code design

Here is how the code is organized so as to build ...

