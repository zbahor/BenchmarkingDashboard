#User interface for CAMARADES Becnhmarking shiny app
#Designed by Zsanett Bahor, April 2020


# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  

#rob_filter <- reactive({
                
#})
  
output$rob_plot <- renderPlotly({
 plot_ly(robdata,x=~Year,y=~Randomised_percentage,type = 'scatter', mode = 'lines')
})
  # output$distPlot <- renderPlot({
  #   
  #   # generate bins based on input$bins from ui.R
  #   x    <- faithful[, 2] 
  #   bins <- seq(min(x), max(x), length.out = input$bins + 1)
  #   
  #   # draw the histogram with the specified number of bins
  #   hist(x, breaks = bins, col = 'darkgray', border = 'white')
  #   
  # })
  
})
