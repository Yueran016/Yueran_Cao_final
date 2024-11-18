here::i_am("code/02_figure_generate.R")

#load data
library(readr)
data <- read_csv("data/Impact_of_Remote_Work_on_Mental_Health.csv")

#generate figure
install.packages("ggplot2")
library(ggplot2)

figure_one <- ggplot(data, aes(x = Industry, fill = as.factor(Stress_Level))) +
  geom_bar(position = "dodge") +
  theme_minimal() +
  scale_fill_brewer(palette = "Set1", name = "Stress Level") +
  labs(title = "Number of People in Different Stress Levels Across Industries",
       x = "Industry",
       y = "Number of People") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  theme(plot.title = element_text(hjust = 0.5))

saveRDS(
  figure_one,
  file = here::here("output/figure_one.rds")
)
