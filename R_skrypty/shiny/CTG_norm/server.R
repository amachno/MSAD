


library(shiny)

shinyServer(function(input, output) {
      
      output$finalPlot <- renderPlot({
            
            
            x    <- rnorm(input$size*10000, input$mean, input$sd)
            dim(x)<-c(10000, input$size)
            means<-apply(x, 1, mean)
            sigma<-input$sd
            S<-sqrt(input$size)*(means-input$mean)/sigma
            norms<-rnorm(100000)
            
            
            hist(S, col='blue', freq = F, main="Średnia z próby o rozkładzie normalnym", xlab="mean")
            lines(density(norms), col='red', lwd=3)
            legend('topleft', legend=c('normal distribution', 'distribution of the mean'), lty=1 ,col=c('red', 'blue'), lwd=c(3,10))
            
            
      })
      
})
