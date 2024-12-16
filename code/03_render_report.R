here::i_am(
  "code/03_render_report.R"
)

rmarkdown::render(
  input = here::here("report.Rmd"),
  output_format = "html_document",
  output_file = here::here("report.html")
)
