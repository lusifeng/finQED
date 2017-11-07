// file futures_opt_call_black.cc
// author: Bernt A Oedegaard

#include <oxstd.h>                                 // mathematics library

futures_option_price_call_european_black(
   decl F,     // futures price
   decl X,     // exercise price
   decl r,     // interest rate
   decl sigma, // volatility
   decl time)   // time to maturity
{
    decl sigma_sqr = sigma*sigma;
    decl time_sqrt = sqrt(time);
    decl d1 = (log (F/X) + 0.5 * sigma_sqr * time) / (sigma * time_sqrt);
    decl d2 = d1 - sigma * time_sqrt;
    return exp(-r*time)*(F * probn(d1) - X * probn(d2));
}
