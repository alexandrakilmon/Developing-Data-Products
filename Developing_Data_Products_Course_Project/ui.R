library(shiny)

# Define UI for application 
shinyUI(fluidPage(
    
    # Application title
    titlePanel("Predict # of Rapes from Urban Population"),
    
    # Sidebar with a slider input 
    sidebarLayout(
        sidebarPanel(
            sliderInput("sliderUrbanPop","What is the urban population?",0,100,value=50),
            submitButton("Submit") #conditional reactive function
        ),
        
        # Show a plot 
        mainPanel(
            plotOutput("plot1"),
            h3("Predicted # of Rapes from Model:"),
            textOutput("pred1")
        )
    )
))