library(shiny)

shinyUI(fluidPage(theme="style.css",
    
    sidebarLayout(
        
        sidebarPanel(
            
            div(id="main1",
            
            div(id="sect1",
                tags$h1("Random Stock Trading")
            ),
            br(),
            div(id="sect2",
                tags$h4("ShinyApp"),
                tags$h4("Assignment for Coursera course on Developing Data Products"),
                tags$h4("by Lalit A Patel"),
                tags$h4("dated 24 January 2015")
            ),
            br(),
            br(),
            div(id="sect3",
                tags$h1("Enter"),
                br(),
                tags$h3("Symbol of the stock to examine"),
                tags$h3(textInput("symb", "", "GOOG")),
                br(),
                tags$h3("Date range of the period to examine"),
                tags$h3(dateRangeInput("dates","",start=as.character(Sys.Date()-30),end=as.character(Sys.Date()))),
                br(),
                tags$h3("Fee for each stock transaction"),
                tags$h3(numericInput("fee","","50")),
                br()
            ),
            br(),
            br(),
            div(id="sect4",
                tags$h4("What does this ShinyApp do?"),
                tags$li("Collect stock prices from Yahoo! Finance for the specified symbol and period."),
                tags$li("Buy and sell random numbers of stock for the specified symbol and period."),
                tags$li("Present a table of daily prices, additions, and balances [right bottom]."),
                tags$li("Present charts of daily prices, additions, and balances [right top]."),
                tags$li("Present results of this stock trading [below].")
            ),
            br(),
            br(),
            div(id="sect5",
                tags$h4("For more ..."),
                tags$li(a("document.html here is an instruction document.", href="document.html")),
                tags$li(a("https://github.com/Lapyl/RandomStockTrading-ShinyApp</a> contains the ShinyApp's code files.", href="https://github.com/Lapyl/RandomStockTrading-ShinyApp")),
                tags$li(a("http://rpubs.com/Lapyl/55835/</a> contains a presentation.", href="http://rpubs.com/Lapyl/55835")),
                tags$li(a("https://github.com/Lapyl/RandomStockTrading-Presentation</a> contains the presentation's code files.", href="https://github.com/Lapyl/RandomStockTrading-Presentation"))
            ),
            br(),
            br(),
            div(id="sect6",
                tags$h4("Results of this stock trading:"),
                br(),
                fluidRow(
                    column(width=6, tags$li("Overall result of this stock trading")),
                    column(width=4, textOutput("NatureProfit"))
                ),
                fluidRow(
                    column(width=6, tags$li("Profit from this stock trading")),
                    column(width=4, textOutput("ValueProfit"))
                ),                
                fluidRow(
                    column(width=6, tags$li("Variation nature of stock prices")),
                    column(width=4, textOutput("NatureStockPrice"))
                ),
                fluidRow(
                    column(width=6, tags$li("Variation coefficient of stock prices")),
                    column(width=4, textOutput("CoeffStockPrice"))
                ),
                fluidRow(
                    column(width=6, tags$li("Variation nature of stock additions")),
                    column(width=4, textOutput("NatureStockAddition"))
                ),
                fluidRow(
                    column(width=6, tags$li("Variation coefficient of stock additions")),
                    column(width=4, textOutput("CoeffStockAddition"))
                ),
                fluidRow(
                    column(width=6, tags$li("Variation nature of stock balances")),
                    column(width=4, textOutput("NatureStockBalance"))
                ),
                fluidRow(
                    column(width=6, tags$li("Variation coefficient of stock balances")),
                    column(width=4, textOutput("CoeffStockBalance"))
                ),
                fluidRow(
                    column(width=6, tags$li("Variation nature of cash balances")),
                    column(width=4, textOutput("NatureCashBalance"))
                ),
                fluidRow(
                    column(width=6, tags$li("Variation coefficient of cash balances")),
                    column(width=4, textOutput("CoeffCashBalance"))
                ),
                fluidRow(
                    column(width=6, tags$li("Variation nature of cash balances")),
                    column(width=4, textOutput("NatureNetBalance"))
                ),
                fluidRow(
                    column(width=6, tags$li("Variation coefficient of cash balances")),
                    column(width=4, textOutput("CoeffNetBalance"))
                )
            )
            )            
        ),
            
        mainPanel(
            
            plotOutput("chStk1"),
            br(),
            plotOutput("chStk2"),
            br(),
            plotOutput("chStk3"),
            br(),
            plotOutput("chStk4"),
            br(),
            plotOutput("chStk5"),
            br(),
            br(),
            tags$h4(align="center", "Random Stock trading data"),
            br(),
            dataTableOutput("dtStk")
       )
    )
))