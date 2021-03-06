// file termstru_yield_interpolated.cc
// author: Bernt A Oedegaard.
// given a set of yields, produce a term structure by linear interpolation.

#include <oxstd.h>
#include "financialNR.h"

term_structure_yield_linearly_interpolated(decl time,
						  const obs_times,
						  const obs_yields)
// assume the yields are in increasing time to maturity order.
{
  decl no_obs = sizerc(obs_times);
  if (no_obs<1) return 0;
    decl t_min = obs_times[0];
    if (time <= t_min) return obs_yields[0];  // earlier than lowest obs.

    decl t_max = obs_times[no_obs-1];
    if (time >= t_max) return obs_yields[no_obs-1]; // later than latest obs

    decl t=1;  // find which two observations we are between
    while ( (t<no_obs) && (time>obs_times[t])) 	{ ++t; }
    decl lambda = (obs_times[t]-time)/(obs_times[t]-obs_times[t-1]);
    // by ordering assumption, time is  between t-1,t
    decl r = obs_yields[t-1] * lambda + obs_yields[t] * (1.0-lambda);
    return r;
}
