# encoding: UTF-8

# This file contains data derived from the IANA Time Zone Database
# (https://www.iana.org/time-zones).

module TZInfo
  module Data
    module Definitions
      module Indian
        module Mahe
          include TimezoneDefinition
          
          timezone 'Indian/Mahe' do |tz|
            tz.offset :o0, 13308, 0, :LMT
            tz.offset :o1, 14400, 0, :'+04'
            
            tz.transition 1906, 12, :o1, -1988163708, 17406549691, 7200
          end
        end
      end
    end
  end
end
