
round2str <-
  function(x, digits=1)
  {
    if(digits < 1)
      stop("This is intended for the case digits >= 1.")
    
    if(length(digits) > 1) {
      digits <- digits[1]
      warning("Using only digits[1]")
    }
    
    tmp <- sprintf(paste("%.", digits, "f", sep=""), x)
    
    # deal with "-0.00" case
    zero <- paste0("0.", paste(rep("0", digits), collapse=""))
    tmp[tmp == paste0("-", zero)] <- zero
    
    tmp
  }

# From KBroman's Broman package:
# add_commas
#' Add commas to a large number
#'
#' Convert a number to a string, with commas every 3rd digit
#'
#' @param numbers Vector of non-negative numbers (will be rounded to integers)
#'
#' @export
#' @return Character string with numbers written like `"7,547,085"`.
#'
#' @examples
#' add_commas(c(231, 91310, 2123, 9911001020, 999723285))

add_commas <-
  function(numbers)
  {
    format(numbers, big.mark=",", scientific=FALSE, trim=TRUE)
  }
