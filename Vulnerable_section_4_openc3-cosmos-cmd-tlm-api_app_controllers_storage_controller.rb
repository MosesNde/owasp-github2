 
 class StorageController < ApplicationController
   def buckets
     # ENV.map returns a big array of mostly nils which is why we compact
     # The non-nil are MatchData objects due to the regex match
     matches = ENV.map { |key, _value| key.match(/^OPENC3_(.+)_BUCKET$/) }.compact
   end
 
   def volumes
     # ENV.map returns a big array of mostly nils which is why we compact
     # The non-nil are MatchData objects due to the regex match
     matches = ENV.map { |key, _value| key.match(/^OPENC3_(.+)_VOLUME$/) }.compact