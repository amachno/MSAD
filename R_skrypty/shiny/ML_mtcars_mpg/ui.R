
library(shiny)

shinyUI(fluidPage(
      
      # Application title
      titlePanel("Metoda największej wiarygodności"),
      
      # Sidebar with a slider input for sample size and the probability
      sidebarLayout(
            sidebarPanel(
                  radioButtons("type",
                              "Estymowany parametr",
                              c("średnia", "Odchylenie sdandardowe")),
                  sliderInput("value",
                              "Wartość nieestymowanego parametru:",
                              min = 0,
                              max = 30,
                              value = 10,
                              step = .1)
            ),
            # Show a plot of the generated distribution
            mainPanel(
                  p("To jest wizualizacja działania metody największej wiarygodności."),
                  p("Dane użyte do analizy to średni dystans na galonie (mpg),
                    wartości są z zestawu danych mtcars dostępnego w pakiecie databases"),
                  p("Możemy ustalić jaki parametr chcemy estymować, 
                    wartość drugiego z parametrów możemy ustalić na suwaku."),
                  p("Wynikiem jest wykres log wiarygodności od wartości parametru"),
                  plotOutput("finalPlot")
                  )
      )
      ))
