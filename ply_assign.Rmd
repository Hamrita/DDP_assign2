---
title: "20/04/2020"
author: ""
date: ""
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = F)
library(plotly)
library(zoo)
library(quantmod)
```


```{r}
eurusd60<-read.csv("EURUSDm60.csv",stringsAsFactors = F)
trace4=list(
  uid = "b47b4766-46ad-4292-b9bf-1210edf4562f", 
  name = "EUR/USD", 
  type = "candlestick",
xx = as.vector(apply(eurusd60[,1:2],1,"paste",collapse=" ")), 
yaxis="y2",
open=eurusd60[,3],
high=eurusd60[,4],
low= eurusd60[,5],
close=eurusd60[,6],
decreasing = list(line = list(color = "#808080")), 
  increasing = list(line = list(color = "#17BECF")), 
  showlegend = TRUE

)
layout <- list(
  title = list(
    font = list(color = "#4D5663"), 
    text = "EUR/USD H1 Chart"
  ), 
  xaxis = list(
    title = list(
      font = list(color = "#4D5663"), 
      text = ""
    ), 
    anchor = "y2", 
    showgrid = TRUE, 
    tickfont = list(color = "#4D5663"), 
    gridcolor = "#E1E5ED", 
    rangeslider = list(visible = FALSE), 
    rangeselector = list(
      x = 0, 
      y = 0.9, 
      font = list(size = 13), 
      bgcolor = "rgba(150, 200, 250, 1)", 
      buttons = list(
        list(
          step = "month", 
          count = 1, 
          label = "1m", 
          stepmode = "backward"
        ), 
        list(
          step = "year", 
          count = 1, 
          label = "1y", 
          stepmode = "backward"
        )
      ), 
      visible = FALSE
    ), 
    zerolinecolor = "#E1E5ED"
  ), 
  yaxis = list(
    title = list(
      font = list(color = "#4D5663"), 
      text = ""
    ), 
    showgrid = TRUE, 
    tickfont = list(color = "#4D5663"), 
    gridcolor = "#E1E5ED", 
    zerolinecolor = "#E1E5ED", 
    showticklabels = FALSE
  ), 
  legend = list(
    font = list(color = "#4D5663"), 
    bgcolor = "#F5F6F9"
  ), 
  margin = list(
    b = 30, 
    l = 30, 
    r = 30, 
    t = 30
  ), 
  yaxis2 = list(domain = c(0.0, 0.9)), 
  showlegend = TRUE, 
  plot_bgcolor = "#F5F6F9", 
  paper_bgcolor = "#F5F6F9"
)
p <- plot_ly()
p <- add_trace(p, uid=trace4$uid, name=trace4$name, type=trace4$type, x=trace4$x, yaxis=trace4$yaxis, low=trace4$low, high=trace4$high, open=trace4$open, close=trace4$close, decreasing=trace4$decreasing, increasing=trace4$increasing, showlegend=trace4$showlegend)
p <- layout(p, title=layout$title, xaxis=layout$xaxis, yaxis=layout$yaxis, legend=layout$legend, margin=layout$margin, yaxis2=layout$yaxis2, showlegend=layout$showlegend, plot_bgcolor=layout$plot_bgcolor, paper_bgcolor=layout$paper_bgcolor)
p
```
