shinyUI(
      pageWithSidebar(
            headerPanel("Grading"),
            sidebarPanel(
                  numericInput("grade1", "Enter the grade on Test 1", 0, min = 0, max = 100),
                  numericInput("grade2", "Enter the grade on Test 2", 0, min = 0, max = 100),
                  numericInput("grade3", "Enter the grade on Test 3", 0, min = 0, max = 100),
                  submitButton("Submit") 
            ),
            mainPanel(
                  tabsetPanel(
                        tabPanel('App Documentation',
                                 h5('Users of this application should put themselves in the
                                    hypothetical situation of being a student in a class
                                    whose final grade is dependant on the scores of three
                                    equally weighted exams. The user should enter the three
                                    grades (between 0 and 100), press the Submit button, and
                                    the output will be the average and the subsequent final 
                                    letter grade for the class.')
                        )
                  ),
                  h3('Calculating a Final Grade'),
                  h4('You Entered the following Grades'),
                  textOutput("G1"),
                  textOutput("G2"),
                  textOutput("G3"),
                  h4('Your Average'),
                  verbatimTextOutput("mean"),
                  h4('Your Grade for the Class'),
                  verbatimTextOutput("finalGrade")
            )
      )
)

mainPanel(
      tabsetPanel(
            tabPanel('Explanation of predication calculation',
                     h5('the prediction I presented bla bla....')
            )
      )
)           