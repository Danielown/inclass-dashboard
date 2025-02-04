dashboardPage(
    skin = "black",
    dashboardHeader(title = "Newton IP"),
    dashboardSidebar(
        sidebarMenu(
            menuItem(
                text = "Personal",
                tabName = "personal",
                icon = icon("gears")
                
            ),
            menuItem(
                text = "Billing",
                tabName = "billing",
                icon = icon("tasks")
            ),
            menuItem(
                text = "Work",
                tabName = "work",
                icon = icon("cubes")
            ),
            menuItem(
                text = "Profile",
                tabName = "profile",
                icon = icon("cubes")
            )
            
        )
    ),
    dashboardBody(
        tabItems(
            tabItem(
                tabName = "personal",
                
                fluidRow(
                    box(
                        title = "Overview",
                        width = 12, 
                        
                        radioButtons(inputId = "status", 
                                     label = "Attrition status?", 
                                     choices = c("yes","no"), inline = TRUE),
                        
                        valueBoxOutput(
                            outputId = "job_sat", width = 3 
                        ),
                        
                        valueBoxOutput(
                            outputId = "env_sat", width = 3 
                        ),
                        
                        valueBoxOutput(
                            outputId = "tenure", width = 3 
                        ),
                        
                        valueBoxOutput(
                            outputId = "income", width = 3 
                        )
                    ) 
                ),
                
                fluidRow(
                    box(
                     title = "Numerical Variabel",
                     width = 12,
                     selectInput(
                         inputId ="pers_num",
                         label ="pilih variabel numerik yang ingin diamati" ,
                         choices = data_attrition %>% 
                             select(age, distance_from_home, 
                                    total_working_years, 
                                    num_companies_worked) %>% 
                             colnames() ,
                         selected = "distance_from_home"
                     ),
                     plotlyOutput(outputId = "personalNum")
                    )
                )
            )
        )
    )
)
