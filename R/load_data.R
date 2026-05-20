# Load and prepare the Slave Voyages dataset.
# Sourced by the setup chunk of chapters 2 to 5.
# Assumes the tidyverse and janitor packages are already loaded.

dat_final <- read_csv("data.csv", show_col_types = FALSE) |>
  clean_names() |>
  rename(id = voyage_id,
         vessel = vessel_name,
         start_port = voyage_itinerary_imputed_port_where_began_ptdepimp_place,
         purchase_place = voyage_itinerary_imputed_principal_place_of_slave_purchase_mjbyptimp,
         arrival_year = year_of_arrival_at_port_of_disembarkation,
         men = percent_men,
         women = percent_women,
         children = percent_children,
         died = slaves_died_during_middle_passage,
         mortality = mortality_rate,
         outcome = slaves_outcome_label) |>
  mutate(across(c(id, vessel, purchase_place, outcome), as.factor),
         start_port = factor(start_port,
                             levels = c("Liverpool", "London", "Bristol",
                                        sort(setdiff(unique(start_port),
                                                     c("Liverpool", "London", "Bristol"))))))

dat_filter <- dat_final |>
  filter(start_port %in% c("Liverpool", "London", "Bristol"))
