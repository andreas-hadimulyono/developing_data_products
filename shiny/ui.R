shinyUI(
  fluidPage(
    # Application Title
    titlePanel('Miles per Gallon Prediction'),
    
    fluidRow(
      column(4,
             selectInput('carTransmissionMode', 'Transmission Mode', c("Automatic" = "0", "Manual" = 1)),
             numericInput('carCylinder', 'Number of Cylinders', 4, min= 4, max = 8, step = 1),
             numericInput('carWeight', 'Cars Weight in lb', 1000, min= 500, max = 6000, step = 100),
             actionButton('calculateButton', 'Calculate')
             ),
      column(4,
             h4('Transmission mode'),
             verbatimTextOutput('carTransmissionMode'),
             h4('Number of Cylinders'),
             verbatimTextOutput('carCylinder'),
             h4('Cars Weight in lb'),
             verbatimTextOutput('carWeight'),
             h4('Which resulted in a predicted MPG of '),
             verbatimTextOutput('prediction')
             ),
      column(4,
             h1("Documentation"),
             p("This simple application aims to predict the Miles Per Gallon for a car given
               its transmission mode, number of cylinders, and weight."),
             p("The algorithm chosen for this simple application is based on a linear model
               fit on transmission mode, number of cylinders, and weight. The model is built
               using the mtcars dataset."),
             p("To use this application, enter the three input parameters and click 
               Calculate button. After calculate button is clicked, the column at the
               center will be updated with the entered input values and the result of
               the prediction."),
             h2("Mode of Transmission"),
             p("The car's mode of transmission, either Automatic or Manual"),
             h2("Number of Cylinder"),
             p("The car's number of cylinder. This number should be between 4 and 8."),
             h2("Car's Weight"),
             p("The car's weight in lb"))
    )
  )
)