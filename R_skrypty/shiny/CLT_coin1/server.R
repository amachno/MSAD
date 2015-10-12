


library(shiny)

shinyServer(function(input, output) {
      
      output$finalPlot <- renderPlot({
            
            
            x    <- rbinom(input$size*10000, 1, input$prob)
            dim(x)<-c(10000, input$size)
            means<-apply(x, 1, mean)
            sigma<-sqrt(input$prob*(1-input$prob))
            S<-sqrt(input$size)*(means-input$prob)/sigma
            norms<-rnorm(100000)
            
            
            hist(S, col='blue', freq = F, main="Mean number of succsesses in Bernoulli trials", xlab="mean")
            lines(density(norms), col='red', lwd=3)
            legend('topleft', legend=c('normal distribution', 'distribution of the mean'), lty=1 ,col=c('red', 'blue'), lwd=c(3,10))
            
            
      })
      
})
