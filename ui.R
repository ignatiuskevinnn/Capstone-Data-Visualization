shinyUI(
  
  dashboardPage(skin = "yellow",
    
    dashboardHeader(title = "Ramen Around The World",  titleWidth = 275), 
    
    dashboardSidebar(
      
      sidebarMenu(
        
        menuItem(text = "Home", icon = icon("home"), tabName = "home" ),
        
        menuItem(text = "Chart", icon = icon("chart-bar"), tabName = "chart"),
        
        menuItem(text = "Data", icon = icon("table"), tabName = "data")
      )
      
    ),
    
    dashboardBody( 
      
      tabItems(
        
        tabItem(tabName = "home",
                
                h1("Data Visualization Capstone"),
           
                h4("by Ignatius Kevin"),
                
                br(),
                
                p("This dataset contains 2580 list of ramen from around the world. The dataset is taken from https://www.kaggle.com/residentmario/ramen-ratings.
                   This dataset will be visualized into Top 10 Country with Most Ramen Brand and 5 Stars Ramen Packaging Style"),
                
                br(),
                
                p("Fields in the dataset:"),
                p("-Brand: Brand of the ramen"),
                p("-Variety: Name of the ramen"),
                p("-Style: Packaging style from the ramen"),
                p("-Country: Origin country of the ramen"),
                p("-Stars: Rating of the ramen")
                
                ),
                
        tabItem(tabName = "chart", align = "center",
                
                # p1
                h2("Top 10 Country with Most Ramen Brand"),
                
                ## input
                selectInput(inputId = "choose_country", 
                            label = "Choose Country",  
                            multiple = T, 
                            selected = c("Japan", "USA", "South Korea"),
                            choices = (ramen10$Country) 
                ),
                
                ## output berupa plotly line chart
                plotlyOutput(outputId = "barchart"),
                
                # p2
                h2("5 Stars Ramen Packaging Style"),
                
                ## input
                checkboxGroupInput(inputId = "select_style",
                                   label = "Select Packaging Style",
                                   choices = unique(ramen5$Style),
                                   inline = T,
                                   selected = c("Pack", "Bowl", "Cup")
                ),
                
                ## output berupa plotly line chart
                plotlyOutput(outputId = "stackedbarchart"),
                
                ),   
        
        tabItem(tabName = "data",
                
                h2("Data Ramen"), 
                
                DT::dataTableOutput(outputId = "table")
                
        )  
        
      )
      
    )
    
  )
)