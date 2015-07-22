shinyServer(
      function(input, output) {
            output$G1 <- renderPrint({input$grade1})
            output$G2 <- renderPrint({input$grade2})
            output$G3 <- renderPrint({input$grade3})
            M <- reactive({mean(c(input$grade1, input$grade2, input$grade3))})
            output$mean <- renderText({M() })
            output$finalGrade <- renderText({
                  if (M() >= 90)
                        'A'
                  else if (M() >= 80)
                        'B'
                  else if (M() >= 70)
                        'C'
                  else if (M() >= 60)
                        'D'
                  else 
                        'F'
            })
      }
)



      
      