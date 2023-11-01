box::use(
  shiny[bootstrapPage, div, moduleServer, NS, renderUI, tags, uiOutput],
  rhino[rhinos]
)

box::use(
  app/view/chart,
  app/view/table
)

#' @export
ui <- function(id) {
  ns <- NS(id)
  
  bootstrapPage(
    # uiOutput(ns("message"))
    table$ui(ns("table")),
    chart$ui(ns("chart"))
  )
  
}

#' @export
server <- function(id) {
  moduleServer(id, function(input, output, session) {
    data <- rhinos
    
    table$server("table", data = data)
    chart$server("chart", data = data)
      
  })
}
