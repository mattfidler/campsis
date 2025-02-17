library(testthat)

context("Test the simulate method with lag times")

seed <- 1
source(paste0("", "testUtils.R"))

test_that("Simulate a bolus with fixed lag time in dataset", {
  model <- model_library$advan4_trans4
  regFilename <- "bolus_fixed_lag_time"

  dataset <- Dataset(3)
  dataset <- dataset %>% add(Bolus(time=0, amount=1000, compartment=1, lag=2)) # 2 hours
  dataset <- dataset %>% add(Observations(times=seq(0,24, by=0.5)))

  results1 <- model %>% simulate(dataset, dest="rxode2", seed=seed)
  spaghettiPlot(results1, "CP")
  expect_equal(nrow(results1), dataset %>% length() * 49)

  results2 <- model %>% simulate(dataset, dest="mrgsolve", seed=seed)
  spaghettiPlot(results2, "CP")
  expect_equal(nrow(results2), dataset %>% length() * 49)

  datasetRegressionTest(dataset, model, seed=seed, filename=paste0(regFilename, "_dataset"))
  outputRegressionTest(results1, output="CP", filename=regFilename)
  outputRegressionTest(results2, output="CP", filename=regFilename)
})

test_that("Simulate a bolus with fixed lag time in model", {
  model <- model_library$advan4_trans4
  regFilename <- "bolus_fixed_lag_time"

  dataset <- Dataset(3)
  dataset <- dataset %>% add(Bolus(time=0, amount=1000, compartment=1))
  dataset <- dataset %>% add(Observations(times=seq(0,24, by=0.5)))

  # 2 hours lag time, no variability
  model <- model %>% add(LagTime(compartment=1, rhs="2"))

  results1 <- model %>% simulate(dataset, dest="rxode2", seed=seed)
  spaghettiPlot(results1, "CP")
  expect_equal(nrow(results1), dataset %>% length() * 49)

  results2 <- model %>% simulate(dataset, dest="mrgsolve", seed=seed)
  spaghettiPlot(results2, "CP")
  expect_equal(nrow(results2), dataset %>% length() * 49)

  datasetRegressionTest(dataset, model, seed=seed, filename=paste0(regFilename, "_model"))
  outputRegressionTest(results1, output="CP", filename=regFilename)
  outputRegressionTest(results2, output="CP", filename=regFilename)
})
