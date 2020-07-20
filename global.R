#Global file to support the backend of the shiny app

###############
#Packages used
##############
library(shiny)
library(shinyjs)
library(shinythemes)
library(shinycssloaders)
library(shinyWidgets)
library(plotly)
library(ggplot2)

##################
#Data inputs
#####################
#pmcdata <- readRDS("data/test_pmcdata.rds") #data about how many studies are openly available in PMC
robdata <- readRDS("data/calculated_summary_stats.rds") #main risk of bias decision dataset


#####################
#Lists
########################
#list of institutions
institutions_list <- unique(robdata$institution_clean)
#list of risk of bias items
rob_list <- c("Random Allocation of Animals to Group","Blinded assessment of outcome","Sample Size Calculation")