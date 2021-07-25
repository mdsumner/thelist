## code to prepare `DATASET` dataset goes here

list <- thelist::thelist_wfs()
list_layers <- vapour::vapour_layer_names(list)

usethis::use_data(list_layers)
