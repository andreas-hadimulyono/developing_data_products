library(car)
data(mtcars)

# get data
fitData <- mtcars[,c("mpg", "am", "cyl", "wt")]

# fit a model
fit <- lm(mpg ~ am + cyl + wt, data = fitData)

predictMpg <- function(am, cyl, wt) {
  newdf <- data.frame(am = am, cyl = cyl, wt = wt)
  predict(fit, newdf)
}

translateAmToText <- function(am){
  if (am == "0")
    "Automatic"
  else
    "Manual"
}

shinyServer(
  function(input, output){
    output$carTransmissionMode <- renderText({
      input$calculateButton
      isolate(translateAmToText(input$carTransmissionMode))
    })
    output$carCylinder <- renderText({
      input$calculateButton
      isolate(input$carCylinder)
    })
    output$carWeight <- renderText({
      input$calculateButton
      isolate(input$carWeight)
    })
    output$prediction <- renderText({
      input$calculateButton
      isolate(predictMpg(as.numeric(input$carTransmissionMode), 
                         as.numeric(input$carCylinder),
                         as.numeric(input$carWeight)/1000))
    })
    
  }
)