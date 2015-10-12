


library(shiny)

shinyServer(function(input, output) {
      
      output$finalPlot <- renderPlot({
            
            
            x    <- rpois(input$size*10000, input$lambda)
            dim(x)<-c(10000, input$size)
            means<-apply(x, 1, mean)
            sigma<-sqrt(input$lambda)
            S<-sqrt(input$size)*(means-input$lambda)/sigma
            norms<-rnorm(100000)
            
            
            hist(S, col='blue', freq = F, main="Średnia z próby o rozkładzie Poissona", xlab="mean")
            lines(density(norms), col='red', lwd=3)
            legend('topleft', legend=c('normal distribution', 'distribution of the mean'), lty=1 ,col=c('red', 'blue'), lwd=c(3,10))
            
            
      })
      
})
