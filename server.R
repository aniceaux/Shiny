#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

#read in dataset
dataMT <- mtcars

#data clean up for
dataMT$am <- factor(dataMT$am,labels=c('Automatic','Manual'))

dataMT$vs <- factor(dataMT$vs, labels=c('V-Shaped', 'Straight'))


# Define server logic to plot various variables against mpg 
server <- function(input, output) {
  
  # Compute the formula text
  formulaText <- reactive({
    paste("mpg ~", input$variable)
  })
  
  # Return the formula text for printing
  output$selected_var <- renderText({
    paste("You have selected the following variable: ", input$variable)
  })
  
  # Generate a plot of the requested variable against mpg
  output$VarPlot <- renderPlot({
    boxplot(as.formula(formulaText()),
            data = dataMT,
            col = "#8BC8AA")
  })
  
}