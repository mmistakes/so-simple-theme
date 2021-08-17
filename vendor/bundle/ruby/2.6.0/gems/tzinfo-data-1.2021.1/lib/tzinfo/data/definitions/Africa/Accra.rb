# encoding: UTF-8

# This file contains data derived from the IANA Time Zone Database
# (https://www.iana.org/time-zones).

module TZInfo
  module Data
    module Definitions
      module Africa
        module Accra
          include TimezoneDefinition
          
          timezone 'Africa/Accra' do |tz|
            tz.offset :o0, -52, 0, :LMT
            tz.offset :o1, 0, 0, :GMT
            tz.offset :o2, 0, 1200, :'+0020'
            tz.offset :o3, 1800, 0, :'+0030'
            tz.offset :o4, 0, 1800, :'+0030'
            
            tz.transition 1915, 11, :o1, -1709337548, 52289355613, 21600
            tz.transition 1919, 11, :o2, -1581206400, 4844573, 2
            tz.transition 1920, 1, :o1, -1577917200, 174407369, 72
            tz.transition 1920, 9, :o2, -1556834400, 29070823, 12
            tz.transition 1921, 1, :o1, -1546294800, 174433721, 72
            tz.transition 1921, 9, :o2, -1525298400, 29075203, 12
            tz.transition 1922, 1, :o1, -1514758800, 174460001, 72
            tz.transition 1922, 9, :o2, -1493762400, 29079583, 12
            tz.transition 1923, 1, :o1, -1483222800, 174486281, 72
            tz.transition 1923, 9, :o2, -1462226400, 29083963, 12
            tz.transition 1924, 1, :o1, -1451686800, 174512561, 72
            tz.transition 1924, 9, :o2, -1430604000, 29088355, 12
            tz.transition 1925, 1, :o1, -1420064400, 174538913, 72
            tz.transition 1925, 9, :o2, -1399068000, 29092735, 12
            tz.transition 1926, 1, :o1, -1388528400, 174565193, 72
            tz.transition 1926, 9, :o2, -1367532000, 29097115, 12
            tz.transition 1927, 1, :o1, -1356992400, 174591473, 72
            tz.transition 1927, 9, :o2, -1335996000, 29101495, 12
            tz.transition 1928, 1, :o1, -1325456400, 174617753, 72
            tz.transition 1928, 9, :o2, -1304373600, 29105887, 12
            tz.transition 1929, 1, :o1, -1293834000, 174644105, 72
            tz.transition 1929, 9, :o2, -1272837600, 29110267, 12
            tz.transition 1930, 1, :o1, -1262298000, 174670385, 72
            tz.transition 1930, 9, :o2, -1241301600, 29114647, 12
            tz.transition 1931, 1, :o1, -1230762000, 174696665, 72
            tz.transition 1931, 9, :o2, -1209765600, 29119027, 12
            tz.transition 1932, 1, :o1, -1199226000, 174722945, 72
            tz.transition 1932, 9, :o2, -1178143200, 29123419, 12
            tz.transition 1933, 1, :o1, -1167603600, 174749297, 72
            tz.transition 1933, 9, :o2, -1146607200, 29127799, 12
            tz.transition 1934, 1, :o1, -1136067600, 174775577, 72
            tz.transition 1934, 9, :o2, -1115071200, 29132179, 12
            tz.transition 1935, 1, :o1, -1104531600, 174801857, 72
            tz.transition 1935, 9, :o2, -1083535200, 29136559, 12
            tz.transition 1936, 1, :o1, -1072995600, 174828137, 72
            tz.transition 1936, 9, :o2, -1051912800, 29140951, 12
            tz.transition 1937, 1, :o1, -1041373200, 174854489, 72
            tz.transition 1937, 9, :o2, -1020376800, 29145331, 12
            tz.transition 1938, 1, :o1, -1009837200, 174880769, 72
            tz.transition 1938, 9, :o2, -988840800, 29149711, 12
            tz.transition 1939, 1, :o1, -978301200, 174907049, 72
            tz.transition 1939, 9, :o2, -957304800, 29154091, 12
            tz.transition 1940, 1, :o1, -946765200, 174933329, 72
            tz.transition 1940, 5, :o2, -936309600, 29157007, 12
            tz.transition 1941, 1, :o1, -915142800, 174959681, 72
            tz.transition 1941, 5, :o2, -904773600, 29161387, 12
            tz.transition 1942, 1, :o1, -883606800, 174985961, 72
            tz.transition 1942, 2, :o3, -880329600, 4860797, 2
            tz.transition 1946, 1, :o1, -756952200, 116727671, 48
            tz.transition 1950, 9, :o4, -610149600, 29202307, 12
            tz.transition 1951, 1, :o1, -599610600, 38938361, 16
            tz.transition 1951, 9, :o4, -578613600, 29206687, 12
            tz.transition 1952, 1, :o1, -568074600, 38944201, 16
            tz.transition 1952, 9, :o4, -546991200, 29211079, 12
            tz.transition 1953, 1, :o1, -536452200, 38950057, 16
            tz.transition 1953, 9, :o4, -515455200, 29215459, 12
            tz.transition 1954, 1, :o1, -504916200, 38955897, 16
            tz.transition 1954, 9, :o4, -483919200, 29219839, 12
            tz.transition 1955, 1, :o1, -473380200, 38961737, 16
            tz.transition 1955, 9, :o4, -452383200, 29224219, 12
            tz.transition 1956, 1, :o1, -441844200, 38967577, 16
          end
        end
      end
    end
  end
end
