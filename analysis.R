# Load data and packages
library("tidyverse")
conflicts <- read.csv('preprocessed_data_extended.csv')

# Adding deaths a and b together to form Deaths_tot
conflicts$Deaths_tot <- conflicts$Deaths_a + conflicts$Deaths_b

# Colombia
# Trying to select for country and Year, filtering years at the same time wasnt working
conflicts_Col_90_05 <- conflicts %>%
  filter(Country == "Colombia") %>%
  filter(1990 < Year) %>%
  filter(2005 > Year) %>%
  droplevels()
summary(conflicts_Col_90_05)

# Peru
conflicts_Per_90_05 <- conflicts %>%
  filter(Country == "Peru") %>%
  filter(1990 < Year) %>%
  filter(2005 > Year) %>%
  droplevels()
summary(conflicts_Per_90_05)

# Selecting Colombia
deaths.years.Col <- conflicts_Col_90_05 %>%
  group_by(Year) %>%
  summarise(sum(Deaths_tot))
deaths.years.Col$Deaths <- deaths.years.Col$`sum(Deaths_tot)`

# Selecting Peru
deaths.years.Per <- conflicts_Per_90_05 %>%
  group_by(Year) %>%
  summarise(sum(Deaths_tot))
deaths.years.Per$Deaths <- deaths.years.Per$`sum(Deaths_tot)`

# Plot
ggplot(data = deaths.years.Col) +
  geom_line(mapping = aes(x = Year, y = Deaths, colour = 'Colombia')) +
  geom_line(data = deaths.years.Per, mapping = aes(x = Year, y = Deaths, colour = 'Peru'))
