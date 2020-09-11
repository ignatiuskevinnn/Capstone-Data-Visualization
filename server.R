# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  output$barchart <- renderPlotly({
    
    p1 <- ramen10 %>% 
      filter(Country %in% input$choose_country) %>% 
      ggplot(aes(x = n, y = reorder(Country, n),
                 text = glue(
                   "Brand = {n}"
                 ))) +
      geom_col(fill = "#9D34FE") + 
      labs(x = "Total Brand", 
           y = "") +
      theme(legend.position = "none") +
      theme_algo
    
    ggplotly(p1, tooltip = "text")
  })
  
  output$stackedbarchart <- renderPlotly({
    
    p2 <- ramenstyle %>% 
      filter(Style %in% input$select_style) %>% 
      ggplot(aes(fill = Country, reorder(factor(Style), Style, function(x) -length(x)),
                 text = glue(
                   "Country = {Country}"                         
                 ))) +
      geom_bar(position = "Stack") +
      labs(x = "Packaging Style", 
           y = "Total") +
      theme_algo2
    
    ggplotly(p2, tooltip = "text")
  })
  
  
  output$table <- DT::renderDataTable({
    
    ramen
  })
  
})

