    library(arules)
    library(kernlab)
    library(tinytex)
    library(datasets)
    library(ggplot2)
    library(kableExtra)
    library(knitr)
    library(formatR) 
    library(caret)
    library(rattle)
    library(rpart)
    library(rpart.plot)
    library(RColorBrewer)
    library(rattle)
    library(randomForest)
    library(shiny)
    data("USArrests")

    
    # Define server logic 
    shinyServer(function(input, output) {
        model1 <- lm(Rape ~ UrbanPop, data = USArrests)
        
        model1pred <- reactive({
            UrbanPopInput <- input$sliderUrbanPop
            predict(model1,newdata = data.frame(UrbanPop = UrbanPopInput))
        })
        
        output$plot1 = renderPlot({
            UrbanPopInput <- input$sliderUrbanPop
            
            plot(USArrests$UrbanPop,USArrests$Rape,xlab = "Urban Population", ylab = "# of Rapes", bty = "n", pch = 16, xlim = c(0,100), lim = c(0,100))
            abline(model1, col = "red", lwd = 2)
            points(UrbanPopInput, model1pred(), col = "red", pch = 16, cex = 2)
        })
        
        output$pred1 <- renderText({
            model1pred()
        })

    })
    