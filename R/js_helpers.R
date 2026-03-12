#' JavaScript to close navbar dropdown after navigation via actionbuttons or other non-navbar input
#'
#' Adds a JavaScript handler that closes open navbar dropdown menus
#' when clicking outside the navbar.
#'
#' @return A script tag containing JavaScript code.
#' @importFrom htmltools tags HTML
#' @export
#' @examples
#' if (requireNamespace("shiny", quietly = TRUE) && interactive()) {
#'   library(shiny)
#'   ui <- 
#' navbarPage(header = navbar_dropdown_autoclose_js(),
#'           id = "main-navbar",
#'           title = "Example",
#'           navbarMenu(
#'             "Menu",
#'             tabPanel("A", value = "tab_a", actionButton("navigate2B", "Go to Tab B")),
#'             tabPanel("B", value = "tab_b", actionButton("navigate2A", "Go to Tab A"))
#'           )
#')
#'
#'
#'server <- function(input, output, session) {
#'  observeEvent(input$navigate2B, {
#'    updateNavbarPage(session, inputId = "main-navbar", selected = "tab_b")
#'  })
#'  
#'  observeEvent(input$navigate2A, {
#'    updateNavbarPage(session, inputId = "main-navbar", selected = "tab_a")
#'  })
#'}
#'
#'shinyApp(ui, server)
#' }
navbar_dropdown_autoclose_js <- function() {
    tags$script(HTML("
    $(document).on('click', function(event) {
      if (!$(event.target).closest('.navbar').length) {
        $('.navbar-nav .dropdown')
          .removeClass('open show')
          .find('.dropdown-menu')
          .removeClass('show');
      }
    });
  "))
}


#' JavaScript to view image fullscreen on click
#'
#' Adds a JavaScript handler that lets users click on an image to enter/exit 
#' fullscreen
#'
#' @return A script tag containing JavaScript code.
#' @importFrom htmltools tags HTML
#' @export
#' @examples
#' if (requireNamespace("shiny", quietly = TRUE) && interactive()) {
#'   library(shiny)
#'   
#'   addResourcePath(
#'     "mypkg",
#'     system.file("www", package = "icesUtils")
#'   )
#'   
#'   ui <- navbarPage(
#'   header = image_fullscreen_on_click_js(),
#'   title = "Example",
#'   "Click for full screen",
#'   tags$img(src = "mypkg/example-image.png", id = "demo-img", width = "300px", height = "300px")
#'   )
#' 
#' server <- function(input, output, session) {}
#'
#'shinyApp(ui, server)
#' }
image_fullscreen_on_click_js <- function() {
  tags$script(HTML("
      function toggleFullScreen(elem) {
        if (!document.fullscreenElement) {
          elem.requestFullscreen().catch(err => {
            alert('Error attempting to enable fullscreen: ' + err.message);
          });
        } else {
          document.exitFullscreen();
        }
      }
    "))
}
