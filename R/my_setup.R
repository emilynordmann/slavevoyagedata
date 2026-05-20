# book-specific code to include on every page

if (requireNamespace("knitr", quietly = TRUE)) {

  suppressPackageStartupMessages({
    library(tidyverse)
    library(webexercises)
    library(glossary)
  })

  glossary::glossary_path("include/glossary.yml")
  glossary_popup("hover") # "click", "hover" or "none"

  # default knitr options ----
  knitr::opts_chunk$set(
    echo       = TRUE,
    results    = "hold",
    out.width  = '100%',
    fig.width  = 8,
    fig.height = 5,
    fig.align  = 'center',
    dpi        = 96
  )

  # set default ggplot theme
  if (requireNamespace("ggplot2", quietly = TRUE)) {
    ggplot2::theme_set(ggplot2::theme_minimal())
  }
}
