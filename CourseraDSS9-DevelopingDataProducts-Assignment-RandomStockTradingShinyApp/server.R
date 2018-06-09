library(quantmod)
library(ggplot2)
library(Defaults)
library(xts)
library(zoo)

shinyServer(function(input, output) {
    
    inStk <- reactive({
        datt <- getSymbols(input$symb, src="yahoo", from=input$dates[1], to=input$dates[2], auto.assign=FALSE, na.omit=FALSE)
        adjusted <- paste(input$symb,".Adjusted",sep="")
        datt <- datt[, adjusted, drop=F]
        datt <- data.frame(datt)
        datt$Date <- rownames(datt)
        rownames(datt) <- NULL
        datt$StockPrice <- datt[,1]
        datt <- datt[,2:3]
        datt$StockAddition <- 0
        datt$StockBalance <- 0
        datt$CashBalance <- 0
        datt$NetBalance <- 0
        sadd <- sample(0:1000,1)
        datt$StockAddition[1] <- sadd
        datt$StockBalance[1] <- sadd
        datt$CashBalance[1] <- -(sadd*datt$StockPrice[1])
        sbal <- sadd
        cbal <- datt$CashBalance[1]
        for (iI in 2:(nrow(datt))) {
            sadd <- sample(-1000:1000,1)
            if ((sbal + sadd) > 0) { datt$StockAddition[iI] <- sadd } else { datt$StockAddition[iI] <- -sbal }
            datt$StockBalance[iI] <- sbal + datt$StockAddition[iI]
            sbal <- datt$StockBalance[iI]
            datt$CashBalance[iI] <- cbal - datt$StockAddition[iI]*datt$StockPrice[iI] - input$fee
            cbal <- datt$CashBalance[iI]
            datt$NetBalance[iI] <- sbal*datt$StockPrice[iI] + cbal
        }
        datt
    })
    
    output$dtStk <- renderDataTable(inStk())
    
    reStk01 <- reactive({
        datt <- inStk()
        abcd <- round(datt$NetBalance[nrow(datt)],0)
        if (abcd > 1000*nrow(datt)) { efgh <- "Big profit. Congratulations!" }
        else {
            if (abcd > 0) { efgh <- "Some profit. Bravo!" }
            else {
                if (abcd == 0) { efgh <- "No profit. Don't worry!" }
                else {
                    if (abcd < -100*nrow(datt)) { efgh <- "Some loss. Sorry!" }
                    else { efgh <- "Big loss. Condolences!" }
                }
            }
        }
        efgh
    })    
    reStk02 <- reactive({
        datt <- inStk()
        round(datt$NetBalance[nrow(datt)],0)
    })    
    reStk03 <- reactive({
        datt <- inStk()
        abcd <- round(sd(datt$StockPrice)/mean(datt$StockPrice),2)
        if (abcd > 0.7) { efgh <- "Turbulent" }
        else {
            if (abcd > 0.4) { efgh <- "Moderate" }
            else { efgh <- "Stable" }
        }
        efgh
    })    
    reStk04 <- reactive({
        datt <- inStk()
        round(sd(datt$StockPrice)/mean(datt$StockPrice),4)
    })    
    reStk05 <- reactive({
        datt <- inStk()
        abcd <- round(sd(datt$StockAddition)/mean(datt$StockAddition),2)
        if (abcd > 0.7) { efgh <- "Turbulent" }
        else {
            if (abcd > 0.4) { efgh <- "Moderate" }
            else { efgh <- "Stable" }
        }
        efgh
    })    
    reStk06 <- reactive({
        datt <- inStk()
        round(sd(datt$StockAddition)/mean(datt$StockAddition),4)
    })    
    reStk07 <- reactive({
        datt <- inStk()
        abcd <- round(sd(datt$StockBalance)/mean(datt$StockBalance),2)
        if (abcd > 0.7) { efgh <- "Turbulent" }
        else {
            if (abcd > 0.4) { efgh <- "Moderate" }
            else { efgh <- "Stable" }
        }
        efgh
    })    
    reStk08 <- reactive({
        datt <- inStk()
        round(sd(datt$StockBalance)/mean(datt$StockBalance),4)
    })    
    reStk09 <- reactive({
        datt <- inStk()
        abcd <- round(sd(datt$CashBalance)/mean(datt$CashBalance),2)
        if (abcd > 0.7) { efgh <- "Turbulent" }
        else {
            if (abcd > 0.4) { efgh <- "Moderate" }
            else { efgh <- "Stable" }
        }
        efgh
    })    
    reStk10 <- reactive({
        datt <- inStk()
        round(sd(datt$CashBalance)/mean(datt$CashBalance),4)
    })    
    reStk11 <- reactive({
        datt <- inStk()
        abcd <- round(sd(datt$NetBalance)/mean(datt$NetBalance),2)
        if (abcd > 0.7) { efgh <- "Turbulent" }
        else {
            if (abcd > 0.4) { efgh <- "Moderate" }
            else { efgh <- "Stable" }
        }
        efgh
    })    
    reStk12 <- reactive({
        datt <- inStk()
        round(sd(datt$NetBalance)/mean(datt$NetBalance),4)
    })
    
    output$NatureProfit <- renderText(reStk01())
    output$ValueProfit <- renderText(reStk02())
    output$NatureStockPrice <- renderText(reStk03())
    output$CoeffStockPrice <- renderText(reStk04())
    output$NatureStockAddition <- renderText(reStk05())
    output$CoeffStockAddition <- renderText(reStk06())
    output$NatureStockBalance <- renderText(reStk07())
    output$CoeffStockBalance <- renderText(reStk08())
    output$NatureCashBalance <- renderText(reStk09())
    output$CoeffCashBalance <- renderText(reStk10())
    output$NatureNetBalance <- renderText(reStk11())
    output$CoeffNetBalance <- renderText(reStk12())
    
    output$chStk1 <- renderPlot({
        ploo <- ggplot(inStk(), aes(x=Date, y=StockPrice, group=1)) + geom_point(colour="red", size=10, shape=23) + geom_line(colour="green", size=2) # + geom_bar(colour="blue", fill="blue", width=0.03, stat="identity") 
        ploo <- ploo + labs(title = "Stock Price vs Date") + xlab("Date") + ylab("Stock Price")
        print(ploo)
    })
    output$chStk2 <- renderPlot({
        ploo <- ggplot(inStk(), aes(x=Date, y=StockAddition, group=1)) + geom_point(colour="red", size=10, shape=23) + geom_line(colour="green", size=2) + geom_bar(colour="blue", fill="blue", width=0.03, stat="identity") 
        ploo <- ploo + labs(title = "Stock Addition vs Date") + xlab("Date") + ylab("Stock Addition")
        print(ploo)
    })
    output$chStk3 <- renderPlot({
        ploo <- ggplot(inStk(), aes(x=Date, y=StockBalance, group=1)) + geom_point(colour="red", size=10, shape=23) + geom_line(colour="green", size=2) + geom_bar(colour="blue", fill="blue", width=0.03, stat="identity") 
        ploo <- ploo + labs(title = "Stock Balance vs Date") + xlab("Date") + ylab("Stock Balance")
        print(ploo)
    })
    output$chStk4 <- renderPlot({
        ploo <- ggplot(inStk(), aes(x=Date, y=CashBalance, group=1)) + geom_point(colour="red", size=10, shape=23) + geom_line(colour="green", size=2) + geom_bar(colour="blue", fill="blue", width=0.03, stat="identity") 
        ploo <- ploo + labs(title = "Cash Balance vs Date") + xlab("Date") + ylab("Cash Balance")
        print(ploo)
    })
    output$chStk5 <- renderPlot({
        ploo <- ggplot(inStk(), aes(x=Date, y=NetBalance, group=1)) + geom_point(colour="red", size=10, shape=23) + geom_line(colour="green", size=2) + geom_bar(colour="blue", fill="blue", width=0.03, stat="identity") 
        ploo <- ploo + labs(title = "Net Balance vs Date") + xlab("Date") + ylab("Net Balance")
        print(ploo)
    })
    
})