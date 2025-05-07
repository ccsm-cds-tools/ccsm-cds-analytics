#!/bin/sh


# see https://quarto.org/docs/projects/scripts.html#pre-and-post-render
if (!nzchar(Sys.getenv("QUARTO_PROJECT_RENDER_ALL"))) {
  quit()
}

# Tasks to be performed during full render only will go here