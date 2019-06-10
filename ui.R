#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for miles per gallon app ----
ui <- fluidPage(
  
  # App title ----
  titlePanel("Motor Trend Car Road Tests - MPG"),
  
  # Sidebar layout
  sidebarLayout(
    
    # Sidebar panel
    sidebarPanel(
      
      # Select Input from user
      selectInput("variable", "Variables:",
                  c("Engine" = "vs",
                    "Transmission" = "am",
                    "Carburetors" = "carb"))
      
      
    ),
    
    # Main panel for displaying output
    mainPanel(
  
      # Formatted text for selectected varibale
      h3(textOutput("selected_var")),
      
      # Plot based on input variable 
      plotOutput("VarPlot")
      
    )
  )
)
