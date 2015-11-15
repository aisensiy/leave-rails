json.array!(@timecards) do |timecard|
  json.extract! timecard, :id
  json.url timecard_url(timecard, format: :json)
end
