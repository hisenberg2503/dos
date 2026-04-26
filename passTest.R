# 1. Define the given probabilities
p_studies <- 0.6
p_not_studies <- 1 - p_studies  # This is 0.4

p_pass_given_studies <- 0.8
p_pass_given_not_studies <- 0.2

# (i) Probability that he will study AND pass the course
# Formula: P(S ∩ P) = P(S) * P(P|S)
p_study_and_pass <- p_studies * p_pass_given_studies
print(paste("Probability he studies and passes:", p_study_and_pass))

# (ii) Probability that he will pass this course (Total Probability)
# Formula: P(P) = P(S ∩ P) + P(S' ∩ P)
p_pass <- p_study_and_pass + (p_not_studies * p_pass_given_not_studies)
print(paste("Total probability of passing:", p_pass))

# (iii) Probability that he studied GIVEN that he passes (Bayes' Theorem)
# Formula: P(S|P) = P(S ∩ P) / P(P)
p_studies_given_pass <- p_study_and_pass / p_pass
print(paste("Probability he studied given he passed:", round(p_studies_given_pass, 3)))