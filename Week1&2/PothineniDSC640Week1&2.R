# Load the necessary library
library(ggplot2)
library(readr)
library(tidyverse)

# Load the dataset
hotdog_contest_winners <- read.csv("data/hotdog-contest-winners.csv")
hotdog_places <- read_csv("data/hotdog-places.csv" , show_col_types = FALSE)
survey_data <- read_csv("data/obama-approval-ratings.csv", show_col_types = FALSE)

#Bar Chart
ggplot(hotdog_contest_winners, aes(x = Year, y = `Dogs.eaten`)) +
  geom_bar(stat = "identity", fill = "steelblue") +
  theme_minimal() +
  labs(title = "Hot Dog Contest Winners: Dogs Eaten Over Years",
       x = "Year", y = "Dogs Eaten")

colnames(hotdog_contest_winners)

#Stacked Bar chart
hotdog_places_long <- pivot_longer(hotdog_places, cols = -Year, names_to = "Place", values_to = "Dogs Eaten")

ggplot(hotdog_places_long, aes(x = Year, y = `Dogs Eaten`, fill = Place)) +
  geom_bar(stat = "identity", position = "stack") +
  scale_fill_manual(values = c("First_Place" = "gold", "Second_Place" = "#C0C0C0", "Third_Place" = "#cd7f32")) + # bronze color code
  theme_minimal() +
  labs(title = "Hot Dog Eating Contest Places Over Years",
       x = "Year", y = "Dogs Eaten")

#Pie Chart
race_relations <- survey_data[survey_data$Issue == "Race Relations", ]

# Since the first column ("Issue") is not needed for the plot, and to avoid the pivot_longer() error,
# directly use the columns you need
race_relations_long <- pivot_longer(race_relations, 
                                    cols = c(Approve, Disapprove, None), 
                                    names_to = "Response", 
                                    values_to = "Percentage")

ggplot(race_relations_long, aes(x = "", y = Percentage, fill = Response)) +
  geom_bar(width = 1, stat = "identity") +
  coord_polar("y", start = 0) +
  theme_void() +
  labs(title = "Survey on Race Relations")

#Donut Chart
ggplot(race_relations_long, aes(x = 2, y = Percentage, fill = Response)) +
  geom_bar(stat = "identity", width = 1) +
  coord_polar(theta = "y") +
  xlim(c(0.5, 2.5)) +
  theme_void() +
  labs(title = "Survey on Race Relations (Donut Chart)") +
  theme(legend.title = element_blank())
