library(shiny)
library(shinyjs)

ui <- fluidPage(
  useShinyjs(),
  div(
  id = "reset_form",
  textInput("name", "Name", "Dean"),
  numericInput("age", "Age", 27),
  checkboxInput("terms", "I agree", FALSE),
  actionButton("submit", "Submit"),
  actionButton("reset", "Reset Form")
  )
)


server <- function(input, output, session){
  observe({
    toggleState("submit", condition = input$terms)
  })
  
  observeEvent(input$submit, {
    alert("Thank You!")
  })
  
  observeEvent(input$reset, {
    reset("reset_form")
  })
}

shinyApp(ui = ui, server = server)