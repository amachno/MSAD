
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
                  sliderInput("lambda",
                              "lambda:",
                              min = 0.05,
                              max = 20,
                              value = 1,
                              step = .05)
            ),
            # Show a plot of the generated distribution
            mainPanel(
                  p("to jest wizualizacja działania CTG dla Rozkładu Poissona (liczba klientów)"),
                  p("Na suwaku można określić rozmiar próby oraz lambda (średnia i wariancja"),
                  p("Określając wartości rozmiaru próby i labda
                    mozna zauwazyć jak działa wielkość próby i niesymetryczność rozkładu na działanie CTG. "),
                  plotOutput("finalPlot")
                  )
      )
      ))
