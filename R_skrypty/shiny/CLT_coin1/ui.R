
library(shiny)

shinyUI(fluidPage(
      
      # Application title
      titlePanel("Centralne twierdzenie graniczne dla rozkładu Bernulliego"),
      
      # Sidebar with a slider input for sample size and the probability
      sidebarLayout(
            sidebarPanel(
                  sliderInput("size",
                              "Wielkość próby:",
                              min = 1,
                              max = 1000,
                              value = 10),
                  sliderInput("prob",
                              "Prawdopodobieństwo sukcesu:",
                              min = 0.01,
                              max = .99,
                              value = .5,
                              step = .01)
            ),
            # Show a plot of the generated distribution
            mainPanel(
                  p("to jest wizualizacja działania CTG dla rzutu monetą"),
                  p("Na suwaku można określić rozmiar próby oraz prawdopodobieństwo sukcesu"),
                  p("Określając wartości rozmiaru próby i prawdopodobienstwa 
                    sukcesu mozna zauwazyć jak działa wielkość próby i niesymetryczność rozkładu na działanie CTG. "),
                  plotOutput("finalPlot")
                  )
      )
      ))
