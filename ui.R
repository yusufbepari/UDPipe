#---------------------------------------------------------------------#
#               Shiny App around the UDPipe NLP workflow              #                #
#---------------------------------------------------------------------#


library("shiny")

shinyUI(
  fluidPage(
    
    titlePanel("UDPipe NLP workflow"),
    
    sidebarLayout( 
      
      sidebarPanel(  
        
        fileInput("file",label = "Upload text file"),
        
        checkboxGroupInput("upos", 
                            label = h3("Select UPS for Co-occurrences Filtering"),
                            choices = list("adjective" = "ADJ",
                                           "noun" = "NOUN",
                                           "proper noun" = "PROPN",
                                           "adverb"= "ADV",
                                            "verb" = "VERB"),
                            selected = c("NOUN","VERB")
                            )
                  ),# end of sidebar panel
      
      
      mainPanel(
        
        tabsetPanel(type = "tabs",
                    
                    tabPanel("Overview",
                             h4(p("Data input")),
                             p("This app supports only comma separated values (.csv) data file. CSV data file should have headers and the first column of the file should have row names.",align="justify"),
                             p("Please refer to the link below for sample csv file."),
                             br(),
                             h4('How to use this App'),
                             p('To use this app, click on', 
                               span(strong("Upload data (csv file with header)")),
                               'and uppload the csv data file. You can also change the number of clusters to fit in k-means clustering')),
                    tabPanel("annotated documents",
                             dataTableOutput('anot'),
                             br(),
                             br(),
                             downloadButton("downloadData","Download Annotated Data")),
                    tabPanel("Word Cloud Plots", 
                              h3("Nouns"),
                              plotOutput('plot1'),
                              h3("Verbs"),
                              plotOutput('plot2')),         
                    tabPanel("Co-ocuurrence graphs",
                              plotOutput('plot3')
                             )
                    )# end of tabsetPanel
              ) # end of main panel
          )# end of sidebarLayout
      ) # end if fluidPage
    )  # end of UI
 



