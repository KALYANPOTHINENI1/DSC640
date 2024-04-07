# Load necessary libraries
library(ggplot2)
library(readr)
library(tidyverse)

# Read the dataset (replace with the correct path and file name)
population_data <- read.csv("world-population.csv")

# Line Chart using ggplot2
line_chart <- ggplot(population_data, aes(x = Year, y = Population)) +
  geom_line(color = "blue") +
  geom_point(color = "blue") +
  labs(title = "World Population Over the Years (Line Chart)",
       x = "Year",
       y = "Population") +
  theme_minimal()

# Step Chart using ggplot2
step_chart <- ggplot(population_data, aes(x = Year, y = Population)) +
  geom_step(color = "purple") +
  labs(title = "World Population Over the Years (Step Chart)",
       x = "Year",
       y = "Population") +
  theme_minimal()

# Print the charts
print(line_chart)
print(step_chart)
