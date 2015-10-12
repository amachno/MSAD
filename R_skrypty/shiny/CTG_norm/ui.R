
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
                  sliderInput("mean",
                              "Średnia:",
                              min = -100,
                              max = 100,
                              value = 0,
                              step = 1),
                  sliderInput("sd",
                              "Odchylenie standardowe:",
                              min = 1,
                              max = 100,
                              value = 0,
                              step = 1)
            ),
            # Show a plot of the generated distribution
            mainPanel(
                  p("to jest wizualizacja działania CTG dla rozkładu normalnego"),
                  p("Na suwaku można określić rozmiar próby, średnią oraz wariancję rozkładu normalnego"),
                  p("Bez względu na wybór parametrów i rozmiaru próby CTG dobrze przybliża rozkład średniej"),
                  plotOutput("finalPlot")
                  )
      )
      ))
