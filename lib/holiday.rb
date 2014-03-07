require "holiday/version"

def equinox(y)
  delta = 0.242194 * (y - 1980)
  leap = (y - 1980) / 4
  [(20.8431 + delta).floor - leap,
   (23.2488 + delta).floor - leap]
end

def holiday?(y,m,d)
  t = Time.local(y,m,d)
  return true if t.wday == 0 || t.wday == 6
  vernal, autumn = equinox(y)
  return true if m == 1 && d < 4
  fixed = [[2,11],[3,vernal],[4,29],[5,3],[5,4],[5,5],[9,autumn],[11,3],[11,23],[12,23]]
  return true if fixed.include?([m,d])
  return true if fixed.include?([m,d-1]) && t.wday == 1
  return true if m == 5 && d == 6 && t.wday < 4
  return true if ((m == 2 || m == 10) && (d > 7 && d < 15) ||
                  (m == 7 || m == 9) && (d > 14 && d < 22)) && t.wday == 1
end
