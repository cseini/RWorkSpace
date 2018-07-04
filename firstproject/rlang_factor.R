##rlang_factor

# Create the vectors for data frame.
height <- c(132,151,162,139,166,147,122)
weight <- c(48,49,66,53,67,52,40)
gender <- c("male","male","female","female","male","female","male")
plot(factor(gender))
# Create the data frame.
input_data <- data.frame(height,weight,gender,age,team)
print(input_data)
plot(factor(input_data$team))
# Test if the gender column is a factor.
print(is.factor(input_data[,3]))

# Print the gender column so see the levels.
print(input_data$team)

seat_count()
win_count()
score_diff()
gk_height()
count_sche()
