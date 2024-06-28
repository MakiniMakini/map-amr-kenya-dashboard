tab_today <- tabItem(
  tabName = "today",
  fluidRow(
    column(
      #KNH
      width = 6,
      box(
        title = "KNH",
        solidHeader = TRUE,
        status = "teal",
        collapsible = TRUE,
        width = 12,  # Full width of the column
        fluidRow(
          bs4ValueBox(
            value = textOutput("new_cases_KNH"),
            subtitle = "KNH",
            color = "gray",
            icon = icon("users")
          ),
          bs4ValueBox(
            value = "123",
            subtitle = "Makini",
            color = "gray",
            icon = icon("users")
          ),
          bs4ValueBox(
            value = "123",
            subtitle = "Makini",
            color = "warning",
            icon = icon("users")
          ),
          bs4ValueBox(
            value = "123",
            subtitle = "Makini",
            color = "danger",
            icon = icon("users")
          )
        )
      )
    ),
    #TNH
    column(
      width = 6,
      box(
        title = "TNH",
        solidHeader = TRUE,
        status = "primary",
        collapsible = TRUE,
        width = 12,  # Full width of the column
        fluidRow(
          bs4ValueBox(
            value = textOutput(""),
            subtitle = "KNH",
            color = "success",
            icon = icon("users")
          ),
          bs4ValueBox(
            value = "123",
            subtitle = "Makini",
            color = "primary",
            icon = icon("users")
          ),
          bs4ValueBox(
            value = "123",
            subtitle = "Makini",
            color = "warning",
            icon = icon("users")
          ),
          bs4ValueBox(
            value = "123",
            subtitle = "Makini",
            color = "danger",
            icon = icon("users")
          )
        )
      )
    )
  ),
  fluidRow(
    column(
      # MP-SHAH
      width = 6,
      box(
        title = "MP-SHAH",
        solidHeader = TRUE,
        status = "maroon",
        collapsible = TRUE,
        width = 12,  # Full width of the column
        fluidRow(
          bs4ValueBox(
            value = textOutput(""),
            subtitle = "KNH",
            color = "success",
            icon = icon("users")
          ),
          bs4ValueBox(
            value = "123",
            subtitle = "Makini",
            color = "primary",
            icon = icon("users")
          ),
          bs4ValueBox(
            value = "123",
            subtitle = "Makini",
            color = "warning",
            icon = icon("users")
          ),
          bs4ValueBox(
            value = "123",
            subtitle = "Makini",
            color = "danger",
            icon = icon("users")
          )
        )
      )
    ),
    column(
      width = 6,
      box(
        title = "Machakos",
        solidHeader = TRUE,
        status = "lime",
        collapsible = TRUE,
        width = 12,  # Full width of the column
        fluidRow(
          bs4ValueBox(
            value = textOutput(""),
            subtitle = "KNH",
            color = "success",
            icon = icon("users")
          ),
          bs4ValueBox(
            value = "123",
            subtitle = "Makini",
            color = "primary",
            icon = icon("users")
          ),
          bs4ValueBox(
            value = "123",
            subtitle = "Makini",
            color = "warning",
            icon = icon("users")
          ),
          bs4ValueBox(
            value = "123",
            subtitle = "Makini",
            color = "danger",
            icon = icon("users")
          )
        )
      )
    )
  ),
  fluidRow(
    column(
      # MP-SHAH
      width = 6,
      box(
        title = "Coast General Hospital",
        solidHeader = TRUE,
        status = "gray",
        collapsible = TRUE,
        width = 12,  # Full width of the column
        fluidRow(
          bs4ValueBox(
            value = textOutput(""),
            subtitle = "KNH",
            color = "success",
            icon = icon("users")
          ),
          bs4ValueBox(
            value = "123",
            subtitle = "Makini",
            color = "primary",
            icon = icon("users")
          ),
          bs4ValueBox(
            value = "123",
            subtitle = "Makini",
            color = "warning",
            icon = icon("users")
          ),
          bs4ValueBox(
            value = "123",
            subtitle = "Makini",
            color = "danger",
            icon = icon("users")
          )
        )
      )
    ),
    column(
      width = 6,
      box(
        title = "JOOTRH",
        solidHeader = TRUE,
        status = "fuchsia",
        collapsible = TRUE,
        width = 12,  # Full width of the column
        fluidRow(
          bs4ValueBox(
            value = textOutput(""),
            subtitle = "KNH",
            color = "gray-dark",
            icon = icon("users")
          ),
          bs4ValueBox(
            value = "123",
            subtitle = "Makini",
            color = "gray-dark",
            icon = icon("users")
          ),
          bs4ValueBox(
            value = "123",
            subtitle = "Makini",
            color = "gray-dark",
            icon = icon("users")
          ),
          bs4ValueBox(
            value = "123",
            subtitle = "Makini",
            color = "gray-dark",
            icon = icon("users")
          )
        )
      )
    )
  )
)
