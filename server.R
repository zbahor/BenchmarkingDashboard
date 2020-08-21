#User interface for CAMARADES Becnhmarking shiny app
#Designed by Zsanett Bahor, April 2020


# Define server logic required to draw a histogram
shinyServer(function(input, output) {

#ROB by Uni percentage graph output
output$rob_plot_perc <- renderPlotly({
  plot_ly(robdata[robdata$institution_clean == input$institution_picker,],x=~Year,y=~get(paste0(input$rob_picker,'_percentage')),type = 'scatter', mode = 'lines') %>%
  layout(xaxis = list(title="Year of Publication",size = 16), yaxis = list(title=paste0("Percentage of studies reporting ",input$rob_picker),size=16))
})

#ROB by Uni absolute value graph output
output$rob_plot_abs <- renderPlotly({
  plot_ly(robdata[robdata$institution_clean == input$institution_picker,],x=~Year,y=~input$rob_picker,type = 'scatter', mode = 'lines')
})

output$value3 <- renderPrint({input$measurepicker})
  
})

