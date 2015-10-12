


library(shiny)

shinyServer(function(input, output) {
      
      output$finalPlot <- renderPlot({
            
            
            if(input$type=="średnia"){
                  my.func<-function(mean.mpg){      
                        data(mtcars)
                        mpg<-mtcars$mpg
                        sd.mpg<-input$value
                        #wektor gęstości
                        d.vec<-dnorm(mpg, mean.mpg, sd.mpg)
                  
                        #log-wiarygodność
                        sum(log(d.vec))
                  }
            
                  points.lik<-seq(10,30,by=.1)
                  lik.points<-rep(NA,length(points.lik))
                  
                  for (i in 1:length(points.lik)) lik.points[i]<-my.func(points.lik[i])
                  
                  my.lab<-"średnia"
            }
            if(input$type!="średnia"){
                  my.func<-function(sd.mpg){      
                        data(mtcars)
                        mpg<-mtcars$mpg
                        mean.mpg<-input$value
                        #wektor gęstości
                        d.vec<-dnorm(mpg, mean.mpg, sd.mpg)
                        
                        #log-wiarygodność
                        sum(log(d.vec))
                  }
                  
                  points.lik<-seq(1,30,by=.1)
                  lik.points<-rep(NA,length(points.lik))
                  
                  for (i in 1:length(points.lik)) lik.points[i]<-my.func(points.lik[i])
                  
                  my.lab<-"odchylenie standardowe"
            }
            
            est<-points.lik[lik.points==max(lik.points)]
            leg<-paste("estymator największej wiarygodności jest równy", as.character(est))
            
            plot(points.lik, lik.points, t='l', 
                 xlab=my.lab, ylab="log-wiarygodność")
            abline(v=est, col="red", lw=2)
            legend("bottomright", col="red", lw=2, legend=leg)
            

            
      })
      

})
