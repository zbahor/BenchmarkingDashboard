#User interface for CAMARADES Becnhmarking shiny app
#Designed by Zsanett Bahor, April 2020


# Define server logic required to draw a histogram
shinyServer(function(input, output) {


#ROB by Uni percentage graph output
#errormess <- eventReactive(input$rob_picker, {
  #if (input$rob_picker!=character[0])

filtered_institutions <- reactive({
  robdata[robdata$institution_clean %in% input$institution_picker,]
})
    
output$rob_plot_perc <- renderPlotly({
  plot_ly(filtered_institutions(),x=~Year,y=~get(paste0(input$rob_picker,'_percentage')),type = 'scatter', mode = 'lines',color=~institution_clean) %>%
  layout(xaxis = list(title="Year of Publication",size = 16, tick0=min(robdata$Year), dtick=1), yaxis = list(title=paste0("Percentage of studies reporting \n",names(rob_list)[which(rob_list==input$rob_picker)]),size=16))
})
# else output$errormessage <- renderText({"Please select atleast one institution"})
#})

#ROB by Uni absolute value graph output
output$rob_plot_abs <- renderPlotly({
  plot_ly(filtered_institutions(),x=~Year,y=~get(input$rob_picker),type = 'scatter', mode = 'lines',color=~institution_clean) %>%
    layout(xaxis = list(title="Year of Publication", size=16,tick0=min(robdata$Year), dtick=1),yaxis=list(title=paste0("Number of studies reporting \n",names(rob_list)[which(rob_list==input$rob_picker)]),size=16))
})



#create colour for bars
#coloured_bar <- reactive({
  
#})
filtered_institutions_byyear <- reactive({
  robdata %>% filter(institution_clean %in% input$institution_picker & Year == input$year_picker)
})

#help with seeing what value is being recorded
#output$errormessage <- renderPrint({paste0("filtered_institutions_byyear()$",input$rob_picker,'_percentage')})

output$institution_bargraph  <- renderPlotly({
  plot_ly(filtered_institutions_byyear(),x=~institution_clean, y=~get(paste0(input$rob_picker,'_percentage')), type= 'bar') %>% 
    layout(title= list(title=paste0("Reporting of ",names(rob_list)[which(rob_list == input$rob_picker)]," by insitution in ",input$year_picker)), xaxis = list(title="Institution", size=16),yaxis= list(title=paste0("Percentage of studies reporting \n",names(rob_list)[which(rob_list==input$rob_picker)]),size=16))
})

#filtered_institutions_byyear()$
})

