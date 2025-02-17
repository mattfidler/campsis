library(testthat)

context("Test the simulate method with initial conditions")

seed <- 1
source(paste0("", "testUtils.R"))

test_that("Simulate initial conditions, observations starting at 0 (rxode2/mrgsolve)", {
  model <- model_library$advan3_trans4
  model <- model %>% add(InitialCondition(compartment=1, rhs="1000"))

  regFilename <- "initial_conditions"

  dataset <- Dataset(3)
  dataset <- dataset %>% add(Observations(times=seq(0,72, by=1)))

  results1 <- model %>% simulate(dataset, dest="rxode2", seed=seed)
  spaghettiPlot(results1, "CP")

  results2 <- model %>% simulate(dataset, dest="mrgsolve", seed=seed)
  spaghettiPlot(results2, "CP")

  outputRegressionTest(results1 %>% dplyr::filter(TIME >=5), output="CP", filename=regFilename)
  outputRegressionTest(results2 %>% dplyr::filter(TIME >=5), output="CP", filename=regFilename)
})

test_that("Simulate initial conditions, observations starting at 5 (rxode2/mrgsolve)", {
  model <- model_library$advan3_trans4
  model <- model %>% add(InitialCondition(compartment=1, rhs="1000"))

  regFilename <- "initial_conditions"

  dataset <- Dataset(3)
  dataset <- dataset %>% add(Observations(times=seq(5,72, by=1)))

  results1 <- model %>% simulate(dataset, dest="rxode2", seed=seed)
  spaghettiPlot(results1, "CP")

  results2 <- model %>% simulate(dataset, dest="mrgsolve", seed=seed)
  spaghettiPlot(results2, "CP")

  outputRegressionTest(results1, output="CP", filename=regFilename)
  outputRegressionTest(results2, output="CP", filename=regFilename)
})
