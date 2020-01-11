
#Code for chart from tweet by gka@vis.social @driven_by_data 

library(readr)
library(ggplot2)
library(plotly)

d <- read_csv("syd_weather.csv")

p <- ggplot(d, aes(x=Year, y=`Mean maximum temperature (°C)`)) +
  geom_point(size=0.3) +
  facet_grid(. ~ Month) +
  geom_smooth(method = "loess", size = 1.5, color='#990000', se = TRUE) +
  theme_minimal() + 
  labs(title = "Monthly mean maximum temperature, Sydney (Observatory Hill), Australia, 1859 - 2019", 
       subtitle = "Month",
       y = "Mean maximum temperature (°C)",
       caption = "Source: Bureau of Meterology climate data - http://www.bom.gov.au/climate/data/ (@annareynolds01)") +
  theme(axis.text.x = element_text(size = 8))

p

ggsave(filename = "sydney_1859_2019.png", height = 6, width = 12, dpi = 144)

#Make an interactive version
ggplotly(p)
