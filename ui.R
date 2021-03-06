#User interface for CAMARADES Becnhmarking shiny app
#Designed by Zsanett Bahor, April 2020

###############################################.
## Header ---- 
###############################################.
  tagList( #needed for shinyjs
    useShinyjs(),  # Include shinyjs from UI for the functions to work
    navbarPage(id = "intabset", #landingpage title
               title = div(tags$a(img(src="CAMARADES_banner.jpg", height=35), href= "http://www.camarades.info/"),
                           style = "position: relative; top: -6px;"), # Navigation bar
               windowTitle = "Benchmarking Tool", #title for browser tab
               theme = shinytheme("superhero"), #Theme of the app #dark blue background
               collapsible = TRUE, #tab panels collapse into menu in small screens
              # header =         
                # tags$head( #CSS styles
                 #  cookie_box, ##Cookie box
                 #  tags$link(rel="shortcut icon", href="favicon_scotpho.ico"), #Icon for browser tab
               header = includeCSS("www/style.css")
                 #  HTML("<base target='_blank'>") # to make external links open a new tab
                 ,
    
########################################################
#Landing Page
#########################################################
tabPanel(title="", icon = icon("home"),   
             
mainPanel(width=11, style="margin-left:4%, margin-right:4%",
          
          fluidRow(column(7,p(h3("Welcome to the CAMARADES Benchmarking Tool"),
                              br(),
                             h5("This app was designed as an interactive dashboard for preliminary benchmarking of",em("in vivo"),"research publications to support audit for improvement for publishing institutions."),
                             h5("The methodologies used continue to be refined, and the performance reported is based on our best estimates, using text mining and automation processes described.
                                You will find more details about the approach taken under each tab."),
                            br(),
                            h4("Identifying Animal Studies"),
                            h5("To identify reports of in vivo research we trained an algorithm on a corpus of 5,000 dual screened publications to identify those describing primary
                            animal research. We do not expect to have captured all in vivo research publications, and some identified publications will not describe in vivo research. We
                            applied the algorithm to the PubMed Central corpus, extracting papers identified as describing in vivo research published from 2011 to 2018."),
                            br(),
                            h4("Text Mining Methodology"),
                            h5("We use Regular Expressions to identify key phrases in full-text articles that describe reports of measures taken within studies to reduce risk of bias.
                            For example,  in the recent focal iscahemia literature this tool has a sensitivity of 0.99 and specificity of 0.77, and so the tool will tend to overstate the prevalence of blinding. 
                            With 100 papers and an observed rate of 50%, the 95% bootstrapped confidence interval is around +/- 10%."),
                            h5("For more details on our approach and the performance of the tool in an exemplar dataset, see ",tags$a(href="https://doi.org/10.1042/CS20160722", "Bahor et al., 2017.", class ="externallink")),
                            br(),br(),
                            h5("If you have any questions regarding this tool and the data behind it please ",tags$a(href="mailto:malcolm.macleod@ed.ac.uk", "contact us.", class="externallink"))
                            ) #column bracket 
                          ) #column bracket
                    ) #row bracket
        ) #panel bracket
 ),  #tab bracket

########################################################
#Papers in PubMed Central
#########################################################
              
    tabPanel(title = "PubMed Central Data", icon = icon("lock-open"),
             mainPanel(width=12,style="margin-left:4%; margin-right:4%",
                       "Hello World")
             
             
         ), # end of tab
    
    tabPanel(title="Risk of Bias Reporting", icon=icon("exclamation-circle")
             
             
         ), #end of tab
    
    tabPanel(title="Report Download", icon=icon("save")
             
         ) #end of tab
  

    ))


