 
 class StorageController < ApplicationController
   def buckets
    return unless authorization('system')
     # ENV.map returns a big array of mostly nils which is why we compact
     # The non-nil are MatchData objects due to the regex match
     matches = ENV.map { |key, _value| key.match(/^OPENC3_(.+)_BUCKET$/) }.compact
   end
 
   def volumes
    return unless authorization('system')
     # ENV.map returns a big array of mostly nils which is why we compact
     # The non-nil are MatchData objects due to the regex match
     matches = ENV.map { |key, _value| key.match(/^OPENC3_(.+)_VOLUME$/) }.compact